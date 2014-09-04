class AddAttributesToProjectSubmissions < ActiveRecord::Migration
  def change
    add_column :project_submissions, :original_filename, :string
    add_column :project_submissions, :upload_file_tmp, :string
    add_column :project_submissions, :upload_file_processing, :boolean, default: false
  end
end
