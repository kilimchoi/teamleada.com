class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      parent_class = code_submission.parent_type == "Step" ? Step : Lesson
      parent = parent_class.find(code_submission.parent_id)
      project_id = parent.project.id
      slide = parent.slides[code_submission.slide_index]

      if slide.submission_context.submission_type != "code"
        FreeResponseSubmissionContent.create(
          user_id: code_submission.user_id,
          project_submission_id: code_submission.project_submission_id,
          content: code_submission.content,
        )
        code_submission.delete
      end
    end
  end
end
