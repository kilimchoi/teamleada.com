class MetricEntry < ActiveRecord::Base
  belongs_to :metric
  belongs_to :day
end
