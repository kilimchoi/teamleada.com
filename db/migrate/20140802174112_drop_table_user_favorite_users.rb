class DropTableUserFavoriteUsers < ActiveRecord::Migration
  def change
    drop_table :user_favorite_users
  end
end
