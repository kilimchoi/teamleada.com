class AddCodeSubmissionToCodeSubmissionEvaluations < ActiveRecord::Migration
  def change
    add_column :code_submissions, :code_submission_evaluation_id, :integer
  end
end
