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
#  has_submit            :boolean          default(FALSE)
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
#

class Project < ActiveRecord::Base
  require 'csv'
  require 'securerandom'
  include Rails.application.routes.url_helpers
  self.primary_key = "uid"

  serialize :description, Array

  has_many :lessons, dependent: :destroy
  has_many :submissions, dependent: :destroy

  has_many :quizes

  has_many :transactions, as: :item
  has_many :interested_users, class_name: ProjectInterest

  has_many :submission_contexts
  has_many :code_submissions
  has_many :code_submission_evaluations

  before_create :set_url

  validates :title, uniqueness: true
  validates :uid, uniqueness: true

  scope :enabled, -> { where(enabled: true) }
  scope :costs_money, -> { enabled.where(paid: true) }
  scope :featured, -> { unscoped.enabled.where(featured: true).newest_first }
  scope :not_featured, -> { enabled.where(featured: false) }

  scope :newest_first, -> { order("uid DESC") }

  default_scope -> { order(:uid) }

  extend FriendlyId
  friendly_id :url, use: :finders

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

  class << self
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
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  # Attributes
  def has_cover_photo?
    !cover_photo.nil?
  end

  def color
    PROJECT_COLORS[ self.featured ? FEATURED : self.category ]
  end

  def section
    PROJECT_SECTION[ self.featured ? FEATURED : self.category ]
  end

  def deadline_in_days
    if !self.deadline.nil?
      self.deadline.div(60 * 60 * 24)
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
    total + code_submission_points
  end

  def code_submission_points
    submission_contexts.count
  end

  def steps
    lessons.collect{ |lesson| lesson.steps + lesson.steps.collect{ |step| step.next_steps }.flatten }.flatten
  end

  # Submissions
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
