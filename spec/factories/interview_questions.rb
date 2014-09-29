# == Schema Information
#
# Table name: interview_questions
#
#  title            :string(255)
#  difficulty_level :integer
#  question         :text
#  posted_at        :datetime
#  industry         :integer
#  question_type    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  uid              :integer          not null, primary key
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_question do
  end
end
