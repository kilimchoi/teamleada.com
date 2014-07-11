class AddOriginalFilenameToPhotosAndResumes < ActiveRecord::Migration
  def change
    add_column :profile_photos, :original_filename, :string
    add_column :resumes, :original_filename, :string
  end
end
