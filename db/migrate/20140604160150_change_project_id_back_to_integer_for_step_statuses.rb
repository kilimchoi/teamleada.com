class ChangeProjectIdBackToIntegerForStepStatuses < ActiveRecord::Migration
  def change
    remove_column :step_statuses, :project_id
    add_column :step_statuses, :project_id, :integer
  end
end
