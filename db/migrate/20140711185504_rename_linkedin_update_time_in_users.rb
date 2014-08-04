class RenameLinkedinUpdateTimeInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :linkedin_most_recent_update, :linkedin_updated_at
  end
end
