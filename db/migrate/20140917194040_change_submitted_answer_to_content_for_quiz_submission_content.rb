class ChangeSubmittedAnswerToContentForQuizSubmissionContent < ActiveRecord::Migration
  def change
    rename_column :quiz_submission_contents, :submitted_answer, :content
  end
end
