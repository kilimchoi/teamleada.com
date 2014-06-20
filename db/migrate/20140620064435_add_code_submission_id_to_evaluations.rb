class AddCodeSubmissionIdToEvaluations < ActiveRecord::Migration
  def change
    remove_column :code_submissions, :code_submission_evaluation_id
    add_column :code_submission_evaluations, :code_submission_id, :integer
  end
end
