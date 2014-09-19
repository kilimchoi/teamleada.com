class GeneralSubmissionContent < SubmissionContent
  # Anything that implments this class must confrom to the SubmissionContent class
  # and it must also have a column for 'content'
  self.abstract_class = true

  class << self
    def create_or_update_with_user_project_slide_content(user, project, slide, content)
      if ProjectSubmission.exists_for_user_project_slide?(user, project, slide)
        self.update_with_user_project_slide_content(user, project, slide, content)
      else
        self.create_with_user_project_slide_content(user, project, slide, content)
      end
    end

    def create_with_user_project_slide_content(user, project, slide, content)
      content_object = self.create(content: content)
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
