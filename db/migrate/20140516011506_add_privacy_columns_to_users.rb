class AddPrivacyColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :who_can_see_profile, :string
    add_column :users, :who_can_send_friend_requests, :string
    add_column :users, :who_can_contact, :string
    add_column :users, :who_can_lookup_using_email, :string
    add_column :users, :who_can_lookup_by_name, :string
  end
end
