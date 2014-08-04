class AddCarrierwavePropertiesToProfilePhotos < ActiveRecord::Migration
  def change
    add_column :profile_photos, :photo_processing, :boolean, default: false
    add_column :profile_photos, :photo_tmp, :string
  end
end
