class AddPointsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :points, :integer, default: 0
  end
end
