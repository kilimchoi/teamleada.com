class CreateSubmissionEvaluations < ActiveRecord::Migration
  def change
    create_table :submission_evaluations do |t|
      t.references :reviewer
      t.references :reviewee
      t.references :project
      t.references :project_submission_id
      t.text :body
      t.boolean :visible
      t.references :content, polymorphic: true

      t.timestamps
    end
  end
end
