class CreateQuizSubmissionEvaluationContents < ActiveRecord::Migration
  def change
    create_table :quiz_submission_evaluation_contents do |t|

      t.timestamps
    end
  end
end
