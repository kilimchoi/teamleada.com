class RemoveUserProfileAndPreferenceColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :looking_for_opportunities
    remove_column :users, :location
    remove_column :users, :bio
    remove_column :users, :phone
    remove_column :users, :headline
    remove_column :users, :industry
    remove_column :users, :date_of_birth
    remove_column :users, :interests
    remove_column :users, :job_bookmarks_count
    remove_column :users, :country_code

    remove_column :users, :who_can_see_profile
    remove_column :users, :who_can_send_friend_requests
    remove_column :users, :who_can_contact
    remove_column :users, :who_can_lookup_using_email
    remove_column :users, :who_can_lookup_by_name
    remove_column :users, :who_can_see_resume
    remove_column :users, :wants_email_about_new_projects
    remove_column :users, :wants_email_from_recruiters
  end
end
