class RenameImageToLInkedInPhotoInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :image, :linkedin_prof_image_url
    change_column :users, :linkedin_prof_image_url, :string, :default => ''
  end
end
