class AddGrantsProjectAccessToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :grants_project_access, :boolean, default: false
  end
end
