# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_submission do
    user nil
    quiz nil
    submitted_answer "MyString"
  end
end
