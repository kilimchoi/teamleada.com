class AddProjectIdToStepStatus < ActiveRecord::Migration
  def change
    add_column :step_statuses, :project_id, :integer
  end
end
