# == Schema Information
#
# Table name: lesson_statuses
#
#  id         :integer          not null, primary key
#  lesson_id  :string(255)
#  user_id    :integer
#  project_id :integer
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson_status do
  end
end
