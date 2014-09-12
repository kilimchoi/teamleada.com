class CreateVideoLinkSubmissionContents < ActiveRecord::Migration
  def change
    create_table :video_link_submission_contents do |t|
      t.text :content
      t.string :link_type

      t.timestamps
    end
  end
end
