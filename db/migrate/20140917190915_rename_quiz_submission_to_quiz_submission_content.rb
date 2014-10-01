class RenameQuizSubmissionToQuizSubmissionContent < ActiveRecord::Migration
  def change
    rename_table :quiz_submissions, :quiz_submission_contents
  end
end
