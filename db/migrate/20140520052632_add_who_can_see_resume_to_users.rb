class AddWhoCanSeeResumeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :who_can_see_resume, :string
  end
end
