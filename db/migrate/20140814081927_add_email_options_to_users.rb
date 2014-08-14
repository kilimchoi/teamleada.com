class AddEmailOptionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wants_email_about_new_projects, :boolean, default: true
    add_column :users, :wants_email_from_recruiters, :boolean, default: true
  end
end
