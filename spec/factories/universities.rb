# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :university do
    name "MyString"
    location "MyString"
    verified? false
  end
end
