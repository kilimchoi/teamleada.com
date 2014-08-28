class AddCoverPhotoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cover_photo, :string
  end
end
