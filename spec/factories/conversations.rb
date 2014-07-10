# == Schema Information
#
# Table name: conversations
#
#  id                   :integer          not null, primary key
#  starter_id           :integer
#  title                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  last_message_sent_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
  end
end
