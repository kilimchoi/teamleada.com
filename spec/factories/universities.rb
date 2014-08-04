# == Schema Information
#
# Table name: universities
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  location           :string(255)
#  verified           :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  linkedin_school_id :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :university do
    name "MyString"
    location "MyString"
    verified? false
  end
end
