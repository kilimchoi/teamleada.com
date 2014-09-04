# == Schema Information
#
# Table name: user_actions
#
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_action do
    name "MyString"
  end
end
