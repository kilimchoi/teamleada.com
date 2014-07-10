# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  enabled    :boolean
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feature do
  end
end
