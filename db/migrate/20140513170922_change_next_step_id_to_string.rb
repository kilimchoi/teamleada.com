class ChangeNextStepIdToString < ActiveRecord::Migration
  def change
    change_column :steps, :next_step_id, :string
  end
end
