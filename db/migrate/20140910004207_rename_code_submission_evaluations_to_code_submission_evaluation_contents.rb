class RenameCodeSubmissionEvaluationsToCodeSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    rename_table :code_submission_evaluations, :code_submission_evaluation_contents
  end
end
