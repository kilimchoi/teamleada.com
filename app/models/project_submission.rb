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

  # TODO(mark): submission context?

  delegate :content, to: :content_object, allow_nil: true
  delegate :submission_context, to: :slide, allow_nil: true

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
  def has_evaluation_for_reviewer?(reviewer)
    evaluations.where(reviewer: reviewer).count > 0
  end

  def evaluation_content_object_for_reviewer(reviewer)
    evaluations.find_by(reviewer: reviewer).content_object
  end

  def new_evaluation_content_object_for_reviewer(reviewer)
    SubmissionEvaluation.new_content_object_for_reviewer(reviewer)
  end

  def first_or_initialize_evaluation_content_object_for_reviewer(reviewer)
    if has_evaluation_for_reviewer?(reviewer)
      evaluation_content_object_for_reviewer(reviewer)
    else
      new_evaluation_content_object_for_reviewer(reviewer)
    end
  end

end
