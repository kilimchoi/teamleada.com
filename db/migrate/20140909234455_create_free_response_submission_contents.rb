class CreateFreeResponseSubmissionContents < ActiveRecord::Migration
  def change
    create_table :free_response_submission_contents do |t|
      t.references :user
      t.references :project_submission
      t.text :content

      t.timestamps
    end
  end
end
