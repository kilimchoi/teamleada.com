# == Schema Information
#
# Table name: conversation_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  conversation_id :integer
#  unread          :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation_user do
  end
end
