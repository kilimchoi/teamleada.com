class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :skill_id

      t.timestamps
    end
  end
end
