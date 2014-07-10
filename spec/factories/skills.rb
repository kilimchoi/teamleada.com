# == Schema Information
#
# Table name: skills
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  linkedin_skill_id :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    skill_name "MyString"
    skill_id "MyString"
  end
end
