# == Schema Information
#
# Table name: story_notifications
#
#  id            :integer          not null, primary key
#  story_id      :integer
#  notified_id   :integer
#  notified_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story_notification do
  end
end
