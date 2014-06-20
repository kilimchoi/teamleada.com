class AddProjectIdToCodeSubmissionEvaluations < ActiveRecord::Migration
  def change
    add_column :code_submission_evaluations, :project_id, :integer
  end
end
