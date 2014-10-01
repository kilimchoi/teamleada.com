# == Schema Information
#
# Table name: project_submissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  slide_id     :string(255)
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_submission do
  end
end
