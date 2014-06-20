class CreateCodeSubmissionEvaluations < ActiveRecord::Migration
  def change
    create_table :code_submission_evaluations do |t|
      t.references :reviewer
      t.references :reviewee
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
