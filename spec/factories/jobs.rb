# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    user nil
    company nil
    start_date "2014-07-08"
    end_date "2014-07-08"
    description "MyText"
  end
end
