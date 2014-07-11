class RenameImageToLInkedInPhotoInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :image, :linkedin_prof_image_url
  end
end
