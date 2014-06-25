class AddScoreFieldsForCodeSubmissionEvaluations < ActiveRecord::Migration
  def change
    remove_column :code_submission_evaluations, :score

    add_column :code_submission_evaluations, :computer_science, :integer
    add_column :code_submission_evaluations, :statistics, :integer
    add_column :code_submission_evaluations, :curiosity, :integer
    add_column :code_submission_evaluations, :communication, :integer
  end
end
