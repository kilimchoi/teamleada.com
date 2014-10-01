class CreateFreeResponseSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    create_table :free_response_submission_evaluation_contents do |t|
      t.integer :computer_science
      t.integer :statistics
      t.integer :curiosity
      t.integer :communication

      t.timestamps
    end
  end
end
