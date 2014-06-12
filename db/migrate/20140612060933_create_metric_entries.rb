class CreateMetricEntries < ActiveRecord::Migration
  def change
    create_table :metric_entries do |t|
      t.references :metric
      t.references :day
      t.decimal :value, precision: 20, scale: 4

      t.timestamps
    end
  end
end
