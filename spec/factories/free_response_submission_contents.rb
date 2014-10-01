# == Schema Information
#
# Table name: free_response_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :free_response_submission_content do
  end
end
