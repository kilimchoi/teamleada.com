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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :metric_entry do
  end
end
