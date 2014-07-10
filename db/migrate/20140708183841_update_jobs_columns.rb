class UpdateJobsColumns < ActiveRecord::Migration
  def change
    remove_reference :jobs, :user
    remove_column :jobs, :description
    remove_column :jobs, :start_date
    remove_column :jobs, :end_date

    add_column :jobs, :position_title, :string
  end
end
