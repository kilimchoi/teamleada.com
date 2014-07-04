class AddLinkedinDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :phone, :string
    add_column :users, :headline, :string
    add_column :users, :indutry, :string
    add_column :users, :public_prof_url, :string
  end
end
