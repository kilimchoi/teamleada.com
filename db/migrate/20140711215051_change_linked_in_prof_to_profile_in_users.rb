class ChangeLinkedInProfToProfileInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :linkedin_prof_image_url, :linkedin_profile_image_url
  end
end
