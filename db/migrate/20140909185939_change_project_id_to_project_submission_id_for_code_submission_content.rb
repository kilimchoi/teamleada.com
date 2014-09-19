class ChangeProjectIdToProjectSubmissionIdForCodeSubmissionContent < ActiveRecord::Migration
  def change
    rename_column :code_submission_contents, :project_id, :project_submission_id
  end
end
