# == Schema Information
#
# Table name: chart_metrics
#
#  id         :integer          not null, primary key
#  chart_id   :integer
#  metric_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class ChartMetric < ActiveRecord::Base
  belongs_to :chart
  belongs_to :metric
end
