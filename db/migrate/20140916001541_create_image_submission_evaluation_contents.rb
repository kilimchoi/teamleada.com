class CreateImageSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    create_table :image_submission_evaluation_contents do |t|

      t.timestamps
    end
  end
end
