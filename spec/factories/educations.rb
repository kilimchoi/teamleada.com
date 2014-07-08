# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :education do
    user nil
    university nil
    field_of_study "MyString"
    degree "MyString"
    start_date "2014-07-08"
    end_date "2014-07-08"
  end
end
