# == Schema Information
#
# Table name: project_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  start_date :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_status do
  end
end
