class CreateChartMetrics < ActiveRecord::Migration
  def change
    create_table :chart_metrics do |t|
      t.references :chart
      t.references :metric

      t.timestamps
    end
  end
end
