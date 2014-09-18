class CreateFileSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    create_table :file_submission_evaluation_contents do |t|
      t.timestamps
    end
  end
end
