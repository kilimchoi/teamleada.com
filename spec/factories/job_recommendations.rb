# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_recommendation do
    reviewer_first_name "MyString"
    reviewer_last_name "MyString"
    reviewer_linkedin_id "MyString"
     ""
    type ""
    summary "MyText"
  end
end
