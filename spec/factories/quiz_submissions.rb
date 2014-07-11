# == Schema Information
#
# Table name: quiz_submissions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  quiz_id          :integer
#  submitted_answer :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_submission do
    user nil
    quiz nil
    submitted_answer "MyString"
  end
end
