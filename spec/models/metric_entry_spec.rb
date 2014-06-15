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

require 'spec_helper'

describe MetricEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end
