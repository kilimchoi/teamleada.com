# == Schema Information
#
# Table name: metric_entries
#
#  id         :integer          not null, primary key
#  metric_id  :integer
#  day_id     :integer
#  value      :decimal(20, 4)
#  created_at :datetime
#  updated_at :datetime
#

class MetricEntry < ActiveRecord::Base
  belongs_to :metric
  belongs_to :day
end
