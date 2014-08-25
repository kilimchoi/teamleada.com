# == Schema Information
#
# Table name: browsable_users
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :browsable_user do
  end
end
