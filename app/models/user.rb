# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  username                     :string(255)
#  role                         :string(255)
#  confirmation_token           :string(255)
#  confirmed_at                 :datetime
#  confirmation_sent_at         :datetime
#  company_id                   :integer
#  first_name                   :string(255)
#  last_name                    :string(255)
#  unconfirmed_email            :string(255)
#  updated_password_at          :datetime
#  who_can_see_profile          :string(255)
#  who_can_send_friend_requests :string(255)
#  who_can_contact              :string(255)
#  who_can_lookup_using_email   :string(255)
#  who_can_lookup_by_name       :string(255)
#  who_can_see_resume           :string(255)
#  looking_for_opportunities    :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  # TODO: Remove this and put in a helper class
  include Rails.application.routes.url_helpers

  include UsersHelper

  # Submissions
  has_many :submissions
  has_many :code_submissions
  has_many :code_submission_evaluations, foreign_key: :reviewee_id
  has_many :quiz_submissions

  # Project completion
  has_many :step_statuses
  has_many :lesson_statuses
  has_many :project_statuses
  has_many :started_projects, through: :project_statuses

  # Invites and Access Codes
  has_many :user_codes
  has_many :codes, through: :user_codes
  has_many :invites
  has_many :invited_users, through: :invites

  # Purchases
  has_many :transactions

  # Uploads
  has_many :resumes
  has_many :profile_photos

  # Page views
  has_many :impressions
  has_many :profile_views, class_name: Impression,
                           foreign_key: :impressionable_id,
                           primary_key: :username

  # LinkedIn
  has_many :job_experiences
  has_many :jobs, through: :job_experiences
  has_many :companies, through: :job_experiences
  has_many :job_recommendations
  has_many :enrollments
  has_many :universities, through: :enrollments
  has_many :publications
  
  # Messaging
  has_many :initiated_conversations, class_name: Conversation, foreign_key: :starter_id
  has_many :messages
  has_many :conversation_users
  has_many :conversations, through: :conversation_users

  belongs_to :company

  default_scope -> { order(:created_at) }
  scope :admins, -> { where(role: "admin") }
  scope :students, -> { where(role: "student") }
  scope :employers, -> { where(role: "employer") + where(role: "recruiter") }
  scope :has_not_started_projects, -> { where("id NOT IN (SELECT DISTINCT(user_id) FROM project_statuses)") }
  scope :with_project_access, -> { where(has_project_access: true) }
  scope :without_project_access, -> { where(has_project_access: false) }
  scope :alphabetically, -> { order("name ASC") }
  scope :has_not_completed_sign_up, -> { where(confirmed_at: nil) }
  scope :missing_name, -> { where("name IS NULL OR first_name IS NULL or last_name IS NULL") }

  validates_format_of :username, :with => /\A[A-Za-z0-9]*\z/
  validates :username, uniqueness: {case_sensitive: false, allow_blank: true}
  validate :check_username
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update

  accepts_nested_attributes_for :resumes
  accepts_nested_attributes_for :profile_photos

  extend FriendlyId
  friendly_id :username, use: :finders

  before_create :set_defaults
  before_save :set_name

  self.per_page = 50
  SETTINGS_TABS = ['account', 'privacy']

  PUBLIC = 'Public'
  CONNECTIONS = 'Connections Only'
  RECRUITERS = 'Recruiters Only'
  CONNECTIONS_AND_RECRUITERS = 'Connections & Recruiters'
  ONLY_ME = 'Only Me'

  USER_CATEGORIES = [PUBLIC, CONNECTIONS, RECRUITERS, CONNECTIONS_AND_RECRUITERS, ONLY_ME]
  USER_TYPES = USER_CATEGORIES.map{ |u| [u, u] }

  include PgSearch
  pg_search_scope :search,
                  against: [[:first_name, 'A'], [:last_name, 'A'], [:email, 'A'], [:username, 'A']],
                  using: {tsearch: {prefix: true, normalization: 2}}

  def == other_user
    self.email == other_user.email
  end

  #
  # Class Methods
  #
  class << self

    def filter(role)
      case role
      when "admins"
        self.admins
      when "students"
        self.students
      when "employers"
        self.employers
      else
        self.all
      end
    end

    def connect_to_linkedin(auth, signed_in_resource=nil)
      if auth.provider == 'linkedin'
        byebug
        user = User.find_by(linkedin_id: auth.uid)
      end
      unless user.nil?
        return user
      else
        registered_user = User.find_by(email: (auth.info.email rescue nil))
        registered_user.nil? ? User.new_with_linked_in_params(auth) : registered_user.update_with_linked_in_params(auth)
      end
    end

  end

  #
  # Validations
  #
  def check_username
    if !self.new_record?
      if username.blank?
        errors.add(:username, "can't be blank")
      end
    end
  end

  #
  # Before filter
  #
  def set_defaults
    self.set_dates
    self.set_privacy_preferences
  end

  def set_name
    self.name = "#{first_name} #{last_name}"
  end

  def set_dates
    self.updated_password_at = Time.now
  end

  def set_privacy_preferences
    self.who_can_see_profile = PUBLIC
    self.who_can_send_friend_requests = PUBLIC
    self.who_can_contact = CONNECTIONS_AND_RECRUITERS
    self.who_can_lookup_using_email = CONNECTIONS_AND_RECRUITERS
    self.who_can_lookup_by_name = CONNECTIONS_AND_RECRUITERS
    self.who_can_see_resume = CONNECTIONS_AND_RECRUITERS
  end

  #
  # Instance Methods
  #
  def name
    name_attribute = read_attribute(:name)
    if name_attribute.nil? || name_attribute.blank?
      email
    else
      name_attribute.titleize
    end
  end

  def first_name
    first_name_attribute = read_attribute(:first_name)
    if first_name_attribute.nil?
      username
    else
      first_name_attribute.capitalize
    end
  end

  def last_name
    last_name_attribute = read_attribute(:last_name)
    if last_name_attribute.nil?
      ""
    else
      last_name_attribute.capitalize
    end
  end

  def search_name
    "#{name} (#{username})"
  end

  def resume
    self.has_resume? ? self.last_resume : nil
  end

  def last_resume
    if self.has_resume?
      resume = self.resumes.last
      if resume.new_record?
        self.resumes.last(2).first
      else
        resume
      end
    end
  end

  def profile_photo
    if has_profile_photo?
      photo = profile_photos.last
      if photo.new_record?
        profile_photos.last(2).first.photo.url
      else
        photo.photo.url
      end
    else
      "default_avatar.png"
    end
  end

  def is_admin?
    role == 'admin'
  end

  def is_company?
    ['recruiter', 'employee'].include? role
  end

  def is_student?
    role.nil? || role == "student"
  end

  def has_project_access_from_code?
    # TODO: Change it so that project-access is not hard-coded
    is_admin? || self.codes.where(access_type: "project-access").count > 0
  end

  def has_missing_basic_info?
    first_name.nil? || last_name.nil? || username.nil? || email.nil?
  end

  def has_missing_profile_info?
    has_missing_basic_info? || resumes.count < 1
  end

  def has_resume?
    self.resumes.count > 0
  end

  def has_profile_photo?
    self.profile_photos.count > 0
  end

  def has_all_project_points?(project)
    project.total_points <= completed_points(project)
  end

  def has_submitted_all_code_submissions_for_project?(project)
    project.code_submissions
  end

  def has_invited_friends?
    invites.count > 0
  end

  def has_invites_remaining?
    invites.count < Invite::INVITES
  end

  def invited?
    !self.invite.nil?
  end

  def owns_project?(project)
    return false if !self.is_company? || self.company.nil?
    self.company.projects.include? project
  end

  def completed?(item)
    # TODO: Change this to a case, when. For some reason it wasn't working...does it use ==?
    if item.class == Project
      !ProjectStatus.find_by(user: self, project: item, completed: true).nil?
    elsif item.class == Lesson
      !LessonStatus.find_by(user: self, lesson_id: item.uid, project: item.project, completed: true).nil?
    elsif item.class == Step
      !StepStatus.find_by(user: self, step_id: item.uid, project: item.project, completed: true).nil?
    else
      false
    end
  end

  def has_not_paid_for_project?(project)
    self.transactions.find_by(item: project).nil?
  end

  def has_started_project?(project)
    LessonStatus.where(user: self, project: project, completed: true).count +
    StepStatus.where(user: self, project: project, completed: true).count > 0
  end

  def has_finished_project?(project)
    !ProjectStatus.find_by(user: self, project: project, completed: true).nil?
  end

  def is_missing_code_submission?(project)
    project.submission_contexts.count != self.code_submissions_for_project(project).count
  end

  def has_completed_submission?(submission_context)
    self.code_submissions_for_project(submission_context.project).select{ |code_submission| code_submission.submission_context == submission_context }.count > 0
  end

  def next_lesson_or_step_for_project_path(project)
    next_lesson_or_step = next_lesson_or_step_for_project(project)
    if next_lesson_or_step == false
      nil
    elsif next_lesson_or_step.class == Lesson
      project_lesson_path(project, next_lesson_or_step)
    else
      project_lesson_step_path(project, next_lesson_or_step.lesson, next_lesson_or_step)
    end
  end

  def next_lesson_or_step_for_project(project)
    project.lessons.each do |lesson|
      lesson_status = LessonStatus.find_by(user: self, lesson_id: lesson.uid, completed: true, project: project)
      if lesson_status.nil?
        return lesson
      end
      lesson.slides.each do |slide|
        if slide.has_submission_contexts? && !self.has_completed_submission?(slide.submission_context)
          return lesson
        end
      end
      lesson.steps.each do |step|
        step_status = StepStatus.find_by(user: self, step_id: step.uid, completed: true, project: project)
        if step_status.nil?
          return step
        end
        step.slides.each do |slide|
          if slide.has_submission_contexts? && !self.has_completed_submission?(slide.submission_context)
            return step
          end
        end
      end
    end
    false
  end

  def next_lesson_for_project(project)
    project.lessons.each do |lesson|
      lesson_status = LessonStatus.find_by(user: self, lesson_id: lesson.uid, completed: true, project: project)
      if lesson_status.nil?
        return lesson
      end
    end
    false
  end

  def completed_projects
    project_statuses.where(completed: true).collect{ |project_status| project_status.project }
  end

  def completed_projects_with_submissions
    project_status_ids = project_statuses.select{ |project_status| project_status.completed && project_status.completed_all_submissions? }
    project_statuses.where(id: project_status_ids).collect{ |project_status| project_status.project }
  end

  def in_progress_projects
    project_statuses.where(completed: false).collect{ |project_status| project_status.project }
  end

  def code_submissions_for_project(project)
    code_submissions.where(project: project)
  end

  def first_missing_code_submission(project)
    project.submission_contexts.each do |submission_context|
      unless self.has_completed_submission? submission_context
        return submission_context
      end
    end
    false
  end

  def completed_points(project)
    total = 0
    step_statuses.each do |step_status|
      if step_status.completed? && step_status.project == project
        total += step_status.step.points
      end
    end
    lesson_statuses.each do |lesson_status|
      if lesson_status.completed? && lesson_status.project == project
        total += lesson_status.lesson.points
      end
    end
    total + code_submissions_for_project(project).count
  end

  def project_progress_percentage(project)
    ((completed_points(project).to_f / project.total_points.to_f) * 100).round(1)
  end

  def evaluations_for_project(project)
    self.code_submission_evaluations.where(project: project)
  end

  def unread_conversations
    self.conversation_users.where(unread: true)
  end

  def unread_conversations_count
    unread_conversations.count
  end

  def invite
    Invite.find_by(invited_user_id: self.id)
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  #
  # Chart Methods
  # All methods in this list must take in a day and return a boolean.
  #
  def created_before?(day)
    created_at <= day.date.tomorrow
  end

  def confirmed_email_before?(day)
    confirmed_at <= day.date.tomorrow
  end

  #
  # Methods
  #
  def generate_new_token
    secret = Devise.friendly_token
    new_token = Devise.token_generator.digest(User, :confirmation_token, secret)
    self.confirmation_token = new_token
    # TODO: Probably shouldn't be doing this...
    self.save(validate: false)
    secret
  end

  def password_updated!
    self.update_attribute(:updated_password_at, Time.now)
  end

  def unconfirm!
    self.confirmed_at = nil
    self.save(validate: false)
  end

  def add_code(code)
    if code.enabled?
      # TODO(mark): Change from hard coded 'project-access'
      if code.access_type == "project-access"
        self.has_project_access = true
        self.save
      end
      self.codes << code
    else
      false
    end
  end

  def complete_step(step)
    StepStatus.where(user: self, step_id: step.uid, completed: true, project: step.project).first_or_create
  end

  def complete_lesson(lesson)
    LessonStatus.where(user: self, lesson_id: lesson.uid, completed: true, project: lesson.project).first_or_create
  end

  #
  # Mailer
  #
  def publish_evaluations(project, evaluations)
    evaluations.each do |evaluation|
      evaluation.visible = true
      evaluation.save
    end
    EvaluationMailer.send_feedback(self, project, evaluations).deliver
  end

end
