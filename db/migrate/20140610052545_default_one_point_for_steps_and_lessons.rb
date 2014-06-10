class DefaultOnePointForStepsAndLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :points
    remove_column :steps, :points

    add_column :lessons, :points, :integer, default: 1
    add_column :steps, :points, :integer, default: 1
  end
end
