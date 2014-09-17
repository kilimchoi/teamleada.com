class RemoveUnusedSubmissionAndEvaluationColumns < ActiveRecord::Migration
  def change
    remove_column :file_submission_contents, :user_id

    remove_column :code_submission_contents, :user_id
    remove_column :code_submission_contents, :parent_id
    remove_column :code_submission_contents, :parent_type
    remove_column :code_submission_contents, :slide_index
  end
end
