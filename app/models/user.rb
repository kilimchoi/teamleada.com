# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  username                   :string(255)
#  role                       :string(255)
#  confirmation_token         :string(255)
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  company_id                 :integer
#  first_name                 :string(255)
#  last_name                  :string(255)
#  unconfirmed_email          :string(255)
#  updated_password_at        :datetime
#  linkedin_id                :string(255)
#  name                       :string(255)
#  nickname                   :string(255)
#  linkedin_profile_image_url :string(255)      default("")
#  public_profile_url         :string(255)
#  has_project_access         :boolean          default(FALSE)
#  linkedin_confirmed_at      :datetime
#  linkedin_updated_at        :datetime
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

  # Delegate attributes to the user_profile and user_preference
  delegate :bio, :location, :phone, :headline, :industry, :date_of_birth,
           :looking_for_opportunities, :interests, :job_bookmarks_count,
           :country_code,
           to: :profile, allow_nil: true

  delegate :bio=, :location=, :phone=, :headline=, :industry=, :date_of_birth=,
           :looking_for_opportunities=, :interests=, :job_bookmarks_count=,
           :country_code=,
           to: :profile, allow_nil: true

  delegate :who_can_see_profile, :who_can_send_friend_requests,
           :who_can_contact, :who_can_lookup_using_email, :who_can_lookup_by_name,
           :who_can_see_resume, :wants_email_about_new_projects,
           :wants_email_from_recruiters,
           to: :preferences, allow_nil: true

  delegate :who_can_see_profile=, :who_can_send_friend_requests=,
           :who_can_contact=, :who_can_lookup_using_email=, :who_can_lookup_by_name=,
           :who_can_see_resume=, :wants_email_about_new_projects=,
           :wants_email_from_recruiters=,
           to: :preferences, allow_nil: true

  # Profile and Preferences
  has_one :user_profile    # Should use the .profile attribute defined below.
  has_one :user_preference # Should use the .preferences attribute defined below.

  # Submissions
  has_many :submissions
  has_many :code_submissions
  has_many :code_submission_evaluations, foreign_key: :reviewee_id
  has_many :quiz_submissions
  has_many :project_submissions

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
  has_many :job_recommendations, foreign_key: :reviewee_id
  has_many :enrollments
  has_many :universities, through: :enrollments
  has_many :publications

  # Messaging
  has_many :initiated_conversations, class_name: Conversation, foreign_key: :starter_id
  has_many :messages
  has_many :conversation_users
  has_many :conversations, through: :conversation_users

  # Friends
  has_many :friendships
  has_many :inverse_friendships, class_name: Friendship,
                                 foreign_key: :friend_id
  has_many :friends, -> { where(friendships: { status: Friendship::ACCEPTED }) },
                     through: :friendships
  has_many :sent_friend_requests, -> { where(friendships: { status: Friendship::PENDING }) },
                                  through: :friendships,
                                  source: :user
  has_many :friend_requests, -> { where(friendships: { status: Friendship::PENDING }) },
                             through: :inverse_friendships,
                             source: :friend

  # Subscriptions
  has_many :subscriptions, as: :subscribable
  has_many :user_subscribers, through: :subscriptions, source: :subscriber, source_type: "User"
  has_many :company_subscribers, through: :subsriptions, source: :subscriber, source_type: "Company"

  # Company specific
  has_many :user_interactions, class_name: UserInteraction,
                               foreign_key: :interactor_id
  has_many :received_interactions, class_name: UserInteraction,
                                   foreign_key: :interactee_id

  belongs_to :company

  scope :admins, -> { where(role: "admin") }
  scope :students, -> { where(role: "student") }
  scope :employers, -> { where(role: "employer") + where(role: "recruiter") }
  scope :has_not_started_projects, -> { where("id NOT IN (SELECT DISTINCT(user_id) FROM project_statuses)") }
  scope :with_project_access, -> { where(has_project_access: true) }
  scope :without_project_access, -> { where(has_project_access: false) }
  scope :has_not_completed_sign_up, -> { where(confirmed_at: nil) }
  scope :missing_name, -> { where("name IS NULL OR first_name IS NULL or last_name IS NULL") }

  # Sorting
  default_scope -> { order(:created_at) }
  scope :alphabetically, -> { order("name ASC") }

  accepts_nested_attributes_for :resumes
  accepts_nested_attributes_for :profile_photos
  accepts_nested_attributes_for :project_submissions

  validates_format_of :username, :with => /\A[A-Za-z0-9_]*\z/
  validates :username, uniqueness: {case_sensitive: false}
  validate :check_username

  extend FriendlyId
  friendly_id :username, use: :finders

  before_save :set_name

  self.per_page = 50

  include PgSearch
  pg_search_scope :search,
                  against: [[:first_name, 'A'], [:last_name, 'A'], [:email, 'A'], [:username, 'A']],
                  using: {tsearch: {prefix: true, normalization: 2}}

  # Default Values
  default_value_for :updated_password_at, Time.now

  def == other_user
    self.email == other_user.email
  end

  #
  # Validations (move these to form objects)
  #
  def check_username
    if !self.new_record?
      if self.username.nil? || self.username.blank?
        errors.add(:username, "can't be blank")
        return
      end
      if self.username.start_with?("_") || !/^[A-Za-z].*/.match(self.username)
        errors.add(:username, "must start with a letter")
      end
    end
  end

  #
  # Class Methods
  #
  class << self
    def company_per_page
      20
    end

    def ordered_find_by_ids(user_ids, reverse=true)
      if reverse
        user_ids = user_ids.reverse
      end
      User.find(user_ids).index_by(&:id).slice(*user_ids).values
    end

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
        user = User.find_by(linkedin_id: auth.uid)
      end
      unless user.nil?
        return user
      else
        registered_user = User.find_by(email: (auth.info.email rescue nil))
        registered_user.nil? ? UsersHelper.new_with_linked_in_params(auth) : UsersHelper.update_with_linked_in_params(auth, registered_user)
      end
    end

    def update_with_linkedin(auth, user)
      # This will update everything, except email
      UsersHelper.update_with_linked_in_params(auth, user)
    end

  end

  #
  # Before filter
  #
  def set_name
    self.name = "#{first_name} #{last_name}"
  end

  #
  # Associations
  #
  def profile
    self.user_profile ||= self.create_user_profile()
  end

  def preferences
    self.user_preference ||= self.create_user_preference()
  end

  def subscribers
    user_subscribers + company_subscribers
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

  # Messages
  def allowed_contacts
    # TODO(mark): Allow users to contact more than just Leada employees in the future
    User.where(id: [1, 2, 3])
  end

  # Resumes
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

  # Profile Photos
  def profile_photo
    if has_profile_photo?
      photo = profile_photos.last
      if photo.new_record?
        profile_photos.last(2).first.url
      else
        photo.url
      end
    elsif has_linkedin_profile_photo?
      linkedin_profile_image_url
    else
      "default_avatar.png"
    end
  end

  # Roles
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

  def has_linkedin_integration?
    !self.linkedin_confirmed_at.nil?
  end

  def has_linkedin_profile_photo?
    !self.linkedin_profile_image_url.nil? && !self.linkedin_profile_image_url.empty?
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
    invites.count < number_of_allowed_invites
  end

  def invited?
    !self.invite.nil?
  end

  def number_of_allowed_invites
    if self.is_admin?
      Float::INFINITY
    else
      3
    end
  end

  def invites_remaining
    number_of_allowed_invites - invites.count
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
    self.code_submissions_for_project(submission_context.project).select{ |code_submission| submission_context.required && code_submission.submission_context == submission_context }.count > 0
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

  def all_projects(completed, category)
    project_statuses.where(completed: completed).collect{ |project_status| project_status.project }.select{ |project| project.category == category }
  end

  def challenges(completed)
    all_projects(completed, Project::CHALLENGE)
  end

  def completed_challenges
    challenges(true)
  end

  def in_progress_challenges
    challenges(false)
  end

  def lessons(completed)
    all_projects(completed, Project::LESSON)
  end

  def completed_lessons
    lessons(true)
  end

  def in_progress_lessons
    lessons(false)
  end

  def completed_projects
    project_statuses.where(completed: true).collect{ |project_status| project_status.project }
  end

  def completed_projects_with_submissions
    project_status_ids = project_statuses.select{ |project_status| project_status.completed && project_status.completed_all_submissions? }
    project_statuses.where(id: project_status_ids).collect{ |project_status| project_status.project }
  end

  def in_progress_projects
    project_statuses.where(completed: false).collect{ |project_status| project_status.project }.compact
  end

  def project_status_for_project(project)
    project_statuses.find_by(project: project)
  end

  def code_submission_of_type_for_project(type, project)
    project.submission_contexts.where(submission_type: type).collect{ |submission_context| submission_context.code_submissions_for_user(self).first }.first
  end

  def video_for_project(project)
    code_submission_of_type_for_project("presentation_vid_linK", project)
  end

  def get_youtube_link_for_project(project)
    video = video_for_project(project)
    video.content.split("?v=").last.split("&").first
  end

  def presentation_for_project(project)
    code_submission_of_type_for_project("presentation_slides_link", project)
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

  def published_evaluations_for_project(project)
    evaluations_for_project(project).published
  end

  def is_waiting_on_evaluations_for_project?(project)
    has_finished_project?(project) && published_evaluations_for_project(project).count < project.submission_contexts.count
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

  def linkedin_before?(day)
    !linkedin_confirmed_at.nil? && linkedin_confirmed_at <= day.date.tomorrow
  end

  def profile_photo_before?(day)
    profile_photos.count > 0 && profile_photos.first.created_at <= day.date.tomorrow
  end

  def resume_uploaded_before?(day)
    resumes.count > 0 && resumes.first.created_at <= day.date.tomorrow
  end

  #
  # Company Properties
  #
  def current_company
    # TODO(mark): We want to allow company employees to be part of more than one company (so we don't lose
    # what they did at one company when they move to another).
    self.company
  end

  def user_interaction_or_nil(other_user)
    UserInteraction.find_by(interactor: self, interactee: other_user)
  end

  def favorited?(other_user)
    user_interaction = user_interaction_or_nil(other_user)
    if user_interaction.nil?
      false
    else
      user_interaction.favorited
    end
  end

  def favorited_at(other_user)
    user_interaction = user_interaction_or_nil(other_user)
    unless user_interaction.nil?
      user_interaction.favorited_at
    end
  end

  def favorited_users
    user_ids = self.user_interactions.where(favorited: true).sort_by_favorited_at.pluck :interactee_id
    User.ordered_find_by_ids(user_ids)
  end

  def favorited_by
    user_ids = self.received_interactions.where(favorited: true).sort_by_favorited_at.pluck :interactor_id
    User.ordered_find_by_ids(user_ids)
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

  def get_project_access_from_project_completion
    project_access_code = Project.project_completion_access_code
    add_code(project_access_code)
  end

  def grant_project_access(project)
    get_project_access_from_project_completion
    send_grant_project_access_email(project)
  end

  def deny_project_access(project)
    @project_status = ProjectStatus.find_by(project: project, user: self)
    @project_status.completed = false
    @project_status.save
    send_deny_project_access_email(project)
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

  def send_grant_project_access_email(project)
    ProjectAccessMailer.send_grant_access_email(self, project).deliver
  end

  def send_deny_project_access_email(project)
    ProjectAccessMailer.send_deny_access_email(self, project).deliver
  end

end

