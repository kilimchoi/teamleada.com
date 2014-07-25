class AddIsNewToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_new, :boolean, :default => false
  end
end
