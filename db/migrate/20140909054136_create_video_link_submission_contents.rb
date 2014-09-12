class CreateVideoLinkSubmissionContents < ActiveRecord::Migration
  def change
    create_table :video_link_submission_contents do |t|
      t.text :content
      t.string :link_type

      # Remove later
      t.integer :project_submission_id

      t.timestamps
    end
  end
end
