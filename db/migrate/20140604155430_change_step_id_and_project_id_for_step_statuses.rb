class ChangeStepIdAndProjectIdForStepStatuses < ActiveRecord::Migration
  def change
    change_column :step_statuses, :step_id, :string
    change_column :step_statuses, :project_id, :string
  end
end
