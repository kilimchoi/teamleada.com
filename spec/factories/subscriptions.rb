# == Schema Information
#
# Table name: subscriptions
#
#  id                :integer          not null, primary key
#  subscriber_id     :integer
#  subscriber_type   :string(255)
#  subscribable_id   :integer
#  subscribable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
  end
end
