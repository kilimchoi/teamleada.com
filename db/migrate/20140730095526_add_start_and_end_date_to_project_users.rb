class AddStartAndEndDateToProjectUsers < ActiveRecord::Migration
  def change
    add_column :project_statuses, :start_date, :datetime
    add_column :project_statuses, :end_date, :datetime
  end
end
