class AddPhotoToProfilePhotos < ActiveRecord::Migration
  def change
    add_column :profile_photos, :photo, :string
  end
end
