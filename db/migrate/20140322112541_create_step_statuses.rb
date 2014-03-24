class CreateStepStatuses < ActiveRecord::Migration
  def change
    create_table :step_statuses do |t|
      t.references :user
      t.references :step
      t.boolean :completed

      t.timestamps
    end
  end
end
