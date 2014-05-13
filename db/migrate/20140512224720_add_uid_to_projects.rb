class AddUidToProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :id
    add_column :projects, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE projects ADD PRIMARY KEY (uid);"
  end
end
