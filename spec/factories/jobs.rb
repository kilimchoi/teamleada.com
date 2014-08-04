# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  position_title :string(255)
#

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
