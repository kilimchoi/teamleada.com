# == Schema Information
#
# Table name: project_submissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  slide_id     :string(255)
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ProjectSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :slide
  belongs_to :content_object, foreign_key: :content_id, foreign_type: :content_type, polymorphic: true

  has_many :evaluations, class_name: "SubmissionEvaluation"

  delegate :content, to: :content_object, allow_nil: true
  delegate :submission_context, to: :slide, allow_nil: true

  ADMIN_TABS = ["completed-projects", "all-submissions", "by-project"]

  default_scope -> { order("created_at ASC") }
  scope :by_type, -> (content_type) { where(content_type: content_type) }

  class << self
    def exists_for_user_project_slide?(user, project, slide)
      ProjectSubmission.exists?(user: user, project: project, slide: slide)
    end

    def find_by_user_project_slide(user, project, slide)
      ProjectSubmission.find_by(user: user, project: project, slide: slide)
    end

    def create_with_user_project_slide_content_object(user, project, slide, content_object)
      ProjectSubmission.create(user: user, project: project, slide: slide, content_object: content_object)
    end
  end

  # Attributes
  def evaluation_content_object_class
    base_class = content_type.remove("Content")
    (base_class + "EvaluationContent").constantize
  end

  def has_evaluation_for_reviewer?(reviewer)
    evaluations.where(reviewer: reviewer).count > 0
  end

  def evaluation_content_object_for_reviewer(reviewer)
    evaluations.find_by(reviewer: reviewer).content_object
  end

  def new_evaluation_content_object_for_reviewer(reviewer)
    # TODO(mark): Make it include the reviewer
    evaluation_content_object_class.new
  end

  def first_or_initialize_evaluation_content_object_for_reviewer(reviewer)
    if has_evaluation_for_reviewer?(reviewer)
      evaluation_content_object_for_reviewer(reviewer)
    else
      new_evaluation_content_object_for_reviewer(reviewer)
    end
  end

  # Evaluations
  def has_evaluation_by_user?(user)
    evaluations.where(reviewer: user).count > 0
  end

  def has_evaluation?
    evaluations.count > 0
  end

  # Formatting
  def pretty_submitted_date
    created_at.strftime("%B %d, %Y at %l:%M %p")
  end

end
