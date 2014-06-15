class AddDefaultTimeframeToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :default_timeframe, :date
  end
end
