class CreateRequiredSteps < ActiveRecord::Migration
  def change
    create_table :required_steps do |t|
      t.references :required
      t.references :requiree

      t.timestamps
    end
  end
end
