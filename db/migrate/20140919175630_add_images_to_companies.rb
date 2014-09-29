class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :logo_image, :string
    add_column :companies, :cover_photo_image, :string
  end
end
