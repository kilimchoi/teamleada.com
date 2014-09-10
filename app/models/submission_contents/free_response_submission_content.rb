# == Schema Information
#
# Table name: free_response_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class FreeResponseSubmissionContent < ActiveRecord::Base
  has_one :project_submission, as: :content

  delegate :project, to: :project_submission, allow_nil: true

  class << self
    def create_or_update_with_user_project_slide_content(user, project, slide, content)
      if ProjectSubmission.exists_for_user_project_slide?(user, project, slide)
        FreeResponseSubmissionContent.update_with_user_project_slide_content(user, project, slide, content)
      else
        FreeResponseSubmissionContent.create_with_user_project_slide_content(user, project, slide, content)
      end
    end

    def create_with_user_project_slide_content(user, project, slide, content)
      content_object = FreeResponseSubmissionContent.create(content: content)
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

end
