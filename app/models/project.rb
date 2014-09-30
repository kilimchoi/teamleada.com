# == Schema Information
#
# Table name: projects
#
#  title                 :string(255)
#  description           :text
#  created_at            :datetime
#  updated_at            :datetime
#  url                   :string(255)
#  enabled               :boolean
#  number                :integer
#  has_leaderboard       :boolean          default(FALSE)
#  short_description     :text
#  cost                  :integer
#  paid                  :boolean          default(FALSE)
#  uid                   :integer          not null, primary key
#  difficulty            :string(255)
#  company_overview      :text
#  category              :string(255)
#  is_new                :boolean          default(FALSE)
#  deadline              :integer
#  featured              :boolean          default(FALSE)
#  grants_project_access :boolean          default(FALSE)
#  cover_photo           :string(255)
#  has_content_submit    :boolean          default(FALSE)
#  has_written_submit    :boolean          default(FALSE)
#  project_set_id        :integer
#

class Project < ActiveRecord::Base
  require 'csv'
  require 'securerandom'
  include Rails.application.routes.url_helpers
  self.primary_key = "uid"

  serialize :description, Array

  belongs_to :project_set

  has_many :lessons, dependent: :destroy
  has_many :project_scores

  has_many :quizzes
  has_many :quiz_submissions, through: :quizzes

  has_many :transactions, as: :item
  has_many :interested_users, class_name: ProjectInterest

  # Submission Contexts
  has_many :submission_contexts
  has_many :code_submission_contexts, -> { where(submission_type: SubmissionContext::CODE) }, class_name: "SubmissionContext"
  has_many :free_response_submission_contexts, -> { where(submission_type: SubmissionContext::RESPONSE) }, class_name: "SubmissionContext"
  has_many :image_submission_contexts, -> { where(submission_type: SubmissionContext::IMAGE) }, class_name: "SubmissionContext"
  has_many :presentation_slides_link_submission_contexts, -> { where(submission_type: SubmissionContext::PRESENTATION_SLIDES_LINK) }, class_name: "SubmissionContext"
  has_many :presentation_video_link_submission_contexts, -> { where(submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK) }, class_name: "SubmissionContext"

  has_many :code_submissions
  has_many :code_submission_evaluations

  before_create :set_url

  validates :title, uniqueness: true
  validates :uid, uniqueness: true

  # Scopes
  scope :enabled, -> { where(enabled: true) }
  scope :costs_money, -> { enabled.where(paid: true) }
  scope :featured, -> { unscoped.enabled.where(featured: true).newest_first }
  scope :not_featured, -> { enabled.where(featured: false) }

  scope :newest_first, -> { order("uid DESC") }
  scope :displayable, -> { where(uid: Project.displayable_ids) }
  scope :displayable_for_user, -> (user) { where(uid: Project.displayable_for_user_ids(user)) }

  scope :grants_project_access, -> { where(grants_project_access: true) }

  # Scope by type
  scope :data_challenges, -> { enabled.where(category: CHALLENGE) }
  scope :data_lessons,    -> { enabled.where(category: LESSON) }
  scope :coming_soon,     -> { enabled.where(category: COMING_SOON) }

  default_scope -> { order(:uid) }

  extend FriendlyId
  friendly_id :url, use: :finders

  # TODO(mark): Move constants somewhere else
  BEGINNER = "Beginner"
  INTERMEDIATE = "Intermediate"
  ADVANCED = "Advanced"
  EXPERT = "Expert"
  DIFFICULTIES = [BEGINNER, INTERMEDIATE, ADVANCED, EXPERT]

  LESSON = "lesson"
  CHALLENGE = "challenge"
  COMING_SOON = "coming_soon"

  FEATURED = "featured"

  COLORS = ["red", "blue", "green", "purple"]
  FEATURED_COLORS = ["purple", "blue"]

  PROJECT_COLORS = {
    FEATURED => "purple",
    CHALLENGE => "blue",
    LESSON => "green",
    COMING_SOON => "red",
  }

  PROJECT_SECTION = {
    FEATURED => "featured",
    CHALLENGE => "data-challenges",
    LESSON => "data-lessons",
    COMING_SOON => "coming-soon",
  }

  VALID_FILTERS = ["started", "completed"]

  class << self
    def onboarding_project
      Project.find_by(is_onboarding: true)
    end

    def displayable_ids
      Project.all.select { |project| !project.is_part_of_set? || (project.is_part_of_set? && project.is_first_part_of_set?) }.map(&:uid)
    end

    def displayable_for_user_ids(user)
      if user.nil?
        displayable_ids
      else
        Project.all.select do |project|
          !user.completed_project?(project) && (!project.is_part_of_set? || (project.is_part_of_set? && user.completed_prerequisites_for_project(project)))
        end.map(&:uid)
      end
    end

    def random_set_of_colors(amount)
      COLORS.sample(amount)
    end

    def random_color
      COLORS.sample
    end

    def featured_color(index)
      FEATURED_COLORS[index]
    end

    def project_completion_access_code
      code = Code.where(user_type: "project-completion-access-code").first_or_initialize
      if code.new_record?
        code.value = SecureRandom.hex(4)
        # TODO(mark): stop hard coding project-access
        code.access_type = "project-access"
        code.save
      end
      code
    end
  end

  # Before Filters
  def set_url
    self.url = title.urlify
  end

  # Attributes
  def has_cover_photo?
    !cover_photo.nil?
  end

  # Project Sets
  def is_part_of_set?
    !project_set_id.nil?
  end

  def is_first_part_of_set?
    is_part_of_set? && project_set.first_part == self
  end

  def color
    PROJECT_COLORS[ self.featured ? FEATURED : self.category ]
  end

  def section
    PROJECT_SECTION[ self.featured ? FEATURED : self.category ]
  end

  def has_deadline?
    !self.deadline.nil?
  end

  def deadline_in_days
    if !self.deadline.nil?
      self.deadline.div(60 * 60 * 24)
    end
  end

  def deadline_in_hours
    if !self.deadline.nil?
      self.deadline.div(60 * 60)
    end
  end

  def cost_in_dollars
    if cost.nil?
      "$0"
    else
      "$%.2f" % (cost / 100)
    end
  end

  def difficulty_tag
    case difficulty
    when BEGINNER
      "info"
    when INTERMEDIATE
      "primary"
    when ADVANCED
      "warning"
    when EXPERT
      "danger"
    else
      "default"
    end
  end

  def full_url
    project_path(self)
  end

  def total_points
    total = 0
    lessons.each do |lesson|
      total += lesson.points
      lesson.steps.each do |step|
        total += step.total_points
      end
    end
    total + submission_points
  end

  def submission_points
    submission_contexts.required.count
  end

  def steps
    lessons.collect{ |lesson| lesson.steps + lesson.steps.collect{ |step| step.next_steps }.flatten }.flatten
  end

  # Submissions
  def has_code_submissions?
    submission_contexts.where(submission_type: SubmissionContext::CODE).count > 0
  end

  def has_free_response_submissions?
    submission_contexts.where(submission_type: SubmissionContext::RESPONSE).count > 0
  end

  def has_image_submissions?
    submission_contexts.where(submission_type: SubmissionContext::IMAGE).count > 0
  end

  def has_presentation_slides_link_submissions?
    submission_contexts.where(submission_type: SubmissionContext::PRESENTATION_SLIDES_LINK).count > 0
  end

  def has_presentation_video_link_submissions?
    submission_contexts.where(submission_type: SubmissionContext::PRESENTATION_VIDEO_LINK).count > 0
  end

  def slide_ids_of_required_submission_contexts
    submission_contexts.required.pluck(:slide_id)
  end

  def check_submission(file)
    # Method to check the submission that the user uploaded
    solution_file = File.expand_path("#{Rails.root}/db/project_solutions/#{"%03d" % self.number}-#{self.url}.csv", __FILE__)
    solution_hash = {}

    CSV.foreach(solution_file, :headers => true) do |row|
      solution_hash[row[0]] = row[1]
    end

    total = Float(solution_hash.length)
    correct = 0

    CSV.foreach(file.path, :headers => true) do |row|
      if (solution_hash[row[0]] == row[1]) #if correct answer
        correct += 1
      end
    end

    return correct / total
  end

  def score_improved?(score, submission)
    if submission.nil?
      return false
    end
    score <= submission.score ? false : true
  end

  def submission_rank(submission)
    submissions.each_with_index do |sub, index|
      if sub == submission
        return index + 1
      end
    end
  end

end
