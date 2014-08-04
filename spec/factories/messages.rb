# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  rich_content_id   :integer
#  rich_content_type :string(255)
#  content           :text
#  is_draft          :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  conversation_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
  end
end
