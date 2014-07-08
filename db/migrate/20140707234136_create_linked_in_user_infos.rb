class CreateLinkedInUserInfos < ActiveRecord::Migration
  def change
    create_table :linked_in_user_infos do |t|
      t.string :linkedin_id
      t.string :prof_url

      t.string :images, :array => true
      t.string :recommendations, array => true
      t.string :rec_received_from, array => true
      t.string :favorited_jobs, array => true
      t.string :skills, array => true
      #t.string :w
      t.timestamps
    end
  end
end
