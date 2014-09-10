class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      if code_submission.submission_context.submission_type != "code"
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
