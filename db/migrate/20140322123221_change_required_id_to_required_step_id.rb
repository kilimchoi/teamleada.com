class ChangeRequiredIdToRequiredStepId < ActiveRecord::Migration
  def change
    remove_column :step_requirements, :required_id
    remove_column :step_requirements, :requiree_id

    add_column :step_requirements, :required_step_id, :integer
    add_column :step_requirements, :requiree_step_id, :integer
  end
end
