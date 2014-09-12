class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      parent_class = code_submission.parent_type == "Step" ? Step : Lesson
      parent = parent_class.find(code_submission.parent_id)
      project_id = parent.project.id
      slide = parent.slides[code_submission.slide_index]

      if slide.submission_context.submission_type != "code"
        content = FreeResponseSubmissionContent.create(
          user_id: code_submission.user_id,
          project_submission_id: code_submission.project_submission_id,
          content: code_submission.content,
        )
        project_submission = ProjectSubmission.find(code_submission.project_submission_id)
        project_submission.content_id = content.id
        project_submission.content_type = content.class.to_s
        code_submission.delete
      end
    end
  end
end
