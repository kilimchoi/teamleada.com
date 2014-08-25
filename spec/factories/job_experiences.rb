# == Schema Information
#
# Table name: job_experiences
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  summary          :text
#  start_date       :date
#  end_date         :date
#  created_at       :datetime
#  updated_at       :datetime
#  job_id           :integer
#  end_date_present :boolean
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_experience do
    user nil
    summary "MyText"
    start_date "2014-07-08"
    end_date "2014-07-08"
  end
end
