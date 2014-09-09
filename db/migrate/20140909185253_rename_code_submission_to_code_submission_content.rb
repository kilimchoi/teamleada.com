class RenameCodeSubmissionToCodeSubmissionContent < ActiveRecord::Migration
  def change
    rename_table :code_submissions, :code_submission_contents
  end
end
