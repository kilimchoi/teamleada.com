class ChangeScaleOfScore < ActiveRecord::Migration
  def change
    change_column :submissions, :score, :decimal, precision: 20, scale: 5
    change_column :leaderboards, :baseline, :decimal, precision: 20, scale: 5
  end
end
