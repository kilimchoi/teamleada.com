class AddLinkedInConfDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_confirmed_at, :date_time
    add_column :users, :linkedin_most_recent_update, :date_time
  end
end
