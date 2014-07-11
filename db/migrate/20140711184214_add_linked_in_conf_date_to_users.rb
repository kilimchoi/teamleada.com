class AddLinkedInConfDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_confirmed_at, :datetime
    add_column :users, :linkedin_most_recent_update, :datetime
  end
end
