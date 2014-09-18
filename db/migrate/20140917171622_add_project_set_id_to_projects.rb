class AddProjectSetIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_set_id, :integer
  end
end
