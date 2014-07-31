class RemoveEndDateFromProjectStatuses < ActiveRecord::Migration
  def change
    remove_column :project_statuses, :end_date
  end
end
