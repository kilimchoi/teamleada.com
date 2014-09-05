class AddUidToUserAction < ActiveRecord::Migration
  def change
    remove_column :user_actions, :id
    add_column :user_actions, :uid, :integer, unique: true, null: false
    execute "ALTER TABLE user_actions ADD PRIMARY KEY (uid);"
  end
end
