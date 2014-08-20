class AddRequestedToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :requested, :boolean, defualt: false
  end
end
