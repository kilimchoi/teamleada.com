class AddPointsToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :points, :integer
  end
end
