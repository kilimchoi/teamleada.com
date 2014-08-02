class CreateUserFavoriteUsers < ActiveRecord::Migration
  def change
    create_table :user_favorite_users do |t|
      t.references :favoriter
      t.references :favoritee
      t.references :company

      t.timestamps
    end
  end
end
