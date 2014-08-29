class AddUploadFileToProjectSubmissions < ActiveRecord::Migration
  def change
    add_column :project_submissions, :upload_file, :string
  end
end
