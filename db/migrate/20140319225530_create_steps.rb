class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :lesson
      t.text :content
      t.references :previous_step
      t.references :next_step

      t.timestamps
    end
  end
end
