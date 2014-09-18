class RemoveProjectSubmissionIdFromContent < ActiveRecord::Migration
  def change
    remove_column :code_submission_contents, :project_submission_id
    remove_column :free_response_submission_contents, :project_submission_id
    remove_column :file_submission_contents, :project_submission_id
  end
end
