# == Schema Information
#
# Table name: days
#
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#  date       :date
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :day do
  end
end
