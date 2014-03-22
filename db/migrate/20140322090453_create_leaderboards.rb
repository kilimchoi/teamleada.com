class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.references :project
      t.decimal :baseline, precision: 8, scale: 2

      t.timestamps
    end
  end
end
