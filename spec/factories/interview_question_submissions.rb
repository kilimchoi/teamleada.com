# == Schema Information
#
# Table name: interview_question_submissions
#
#  id                    :integer          not null, primary key
#  interview_question_id :integer
#  user_id               :integer
#  content               :text
#  created_at            :datetime
#  updated_at            :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_question_submission do
  end
end
