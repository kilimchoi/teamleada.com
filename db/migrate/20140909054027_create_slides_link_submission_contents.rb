class CreateSlidesLinkSubmissionContents < ActiveRecord::Migration
  def change
    create_table :slides_link_submission_contents do |t|
      t.text :content
      t.string :link_type

      t.timestamps
    end
  end
end
