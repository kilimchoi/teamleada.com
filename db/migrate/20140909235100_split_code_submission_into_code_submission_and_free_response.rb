class SplitCodeSubmissionIntoCodeSubmissionAndFreeResponse < ActiveRecord::Migration
  def change
    CodeSubmissionContent.all.each do |code_submission|
      if code_submission.submission_context.submission_type != "code"
        FreeResponseSubmissionContent.create(
          user: code_submission.user,
          project_submission: code_submission.project_submission,
          content: code_submission.content,
        )
        code_submission.delete
      end
    end
  end
end
