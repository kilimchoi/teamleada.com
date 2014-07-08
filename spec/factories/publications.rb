# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publication do
    user nil
    title "MyString"
    description "MyText"
    publication_date "2014-07-08"
    publisher "MyString"
  end
end
