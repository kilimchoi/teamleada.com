class RenameRequiredStepsToStepRequirements < ActiveRecord::Migration
  def change
    rename_table :required_steps, :step_requirements
  end
end
