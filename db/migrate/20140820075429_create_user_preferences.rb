class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.references :user

      t.string :who_can_see_profile
      t.string :who_can_send_friend_requests
      t.string :who_can_contact
      t.string :who_can_lookup_using_email
      t.string :who_can_lookup_by_name
      t.string :who_can_see_resume

      t.boolean :wants_email_about_new_projects, default: true
      t.boolean :wants_email_from_recruiters, default: true

      t.timestamps
    end
  end
end
