class AddRequiredToProjectSubmissions < ActiveRecord::Migration
  def change
    add_column :project_submissions, :required, :boolean, default: true
  end
end
