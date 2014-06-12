class ChartMetric < ActiveRecord::Base
  belongs_to :chart
  belongs_to :metric
end
