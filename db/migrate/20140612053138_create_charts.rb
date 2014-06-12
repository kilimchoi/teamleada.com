class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :category
      t.string :title
      t.string :y_axis_label

      t.timestamps
    end
  end
end
