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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart_metric do
  end
end
