# == Schema Information
#
# Table name: launches
#
#  day_id     :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :launch do
  end
end
