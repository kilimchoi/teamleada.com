# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_experience do
    user nil
    summary "MyText"
    start_date "2014-07-08"
    end_date "2014-07-08"
  end
end
