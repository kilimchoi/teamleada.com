# == Schema Information
#
# Table name: code_submissions
#
#  id                            :integer          not null, primary key
#  content                       :text
#  user_id                       :integer
#  project_id                    :integer
#  parent_id                     :string(255)
#  parent_type                   :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#  slide_index                   :integer
#  code_submission_evaluation_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :code_submission do
  end
end
