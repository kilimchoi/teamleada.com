class GeneralSubmissionContent < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def create_or_update_with_user_project_slide_content(user, project, slide, content)
      if ProjectSubmission.exists_for_user_project_slide?(user, project, slide)
        self.class.update_with_user_project_slide_content(user, project, slide, content)
      else
        FreeResponseSubmissionContent.create_with_user_project_slide_content(user, project, slide, content)
      end
    end

    def create_with_user_project_slide_content(user, project, slide, content)
      content_object = self.class.create(content: content)
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
