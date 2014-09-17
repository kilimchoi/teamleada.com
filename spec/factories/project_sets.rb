# == Schema Information
#
# Table name: project_sets
#
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  uid         :integer          not null, primary key
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_set do
  end
end
