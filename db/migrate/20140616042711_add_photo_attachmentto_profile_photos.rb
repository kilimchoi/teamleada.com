class AddPhotoAttachmenttoProfilePhotos < ActiveRecord::Migration
  def change
    add_attachment :profile_photos, :photo
  end
end
