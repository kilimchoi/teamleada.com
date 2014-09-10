# == Schema Information
#
# Table name: code_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class CodeSubmissionContent < ActiveRecord::Base
  include ActionView::Helpers::JavaScriptHelper

  has_one :project_submission, as: :content

  delegate :user,    to: :project_submission, allow_nil: true
  delegate :project, to: :project_submission, allow_nil: true

  default_scope { order(:created_at) }

  ADMIN_TABS = ["completed_projects", "all_code_submissions", "by_project"]

  class << self
    def create_or_update_with_user_project_slide_content(user, project, slide, content)
      if ProjectSubmission.exists_for_user_project_slide?(user, project, slide)
        CodeSubmissionContent.update_with_user_project_slide_content(user, project, slide, content)
      else
        CodeSubmissionContent.create_with_user_project_slide_content(user, project, slide, content)
      end
    end

    def create_with_user_project_slide_content(user, project, slide, content)
      content_object = CodeSubmissionContent.create(content: content)
      project_submission = ProjectSubmission.create_with_user_project_slide_content_object(user, project, slide, content_object)
      content_object
    end

    def update_with_user_project_slide_content(user, project, slide, content)
      project_submission = ProjectSubmission.find_by_user_project_slide(user, project, slide)
      content_object = project_submission.content_object
      content_object.update(content: content)
      content_object
    end
  end

  def uid
    "#{parent_id}_cs#{slide_index}"
  end

  def submission_context
    # TODO: Until we have submssion contexts, show the slide title?
    slide.submission_context || SubmissionContext.new(
      title: "Submission title",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    )
  end

  def pretty_submitted_date
    created_at.strftime("%B %d, %Y at %l:%M %p")
  end

  def has_evaluation_by_user?(user)
    code_submission_evaluations.where(reviewer: user).count > 0
  end

  def has_evaluation?
    code_submission_evaluations.count > 0
  end

  def safe_content
    escape_javascript content.html_safe
  end

end
