class RenameProfUrlInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :public_prof_url, :public_profile_url
  end
end
