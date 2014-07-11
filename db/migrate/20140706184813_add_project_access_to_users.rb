class AddProjectAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_project_access, :boolean, default: false
  end
end
