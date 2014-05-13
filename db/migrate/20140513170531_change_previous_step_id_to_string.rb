class ChangePreviousStepIdToString < ActiveRecord::Migration
  def change
    change_column :steps, :previous_step_id, :string
  end
end
