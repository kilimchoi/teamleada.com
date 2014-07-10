# == Schema Information
#
# Table name: job_recommendations
#
#  id                   :integer          not null, primary key
#  reviewer_first_name  :string(255)
#  reviewer_last_name   :string(255)
#  reviewer_linkedin_id :string(255)
#  reviewee_id          :integer
#  recommendation_type  :string(255)
#  body                 :text
#  created_at           :datetime
#  updated_at           :datetime
#

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
