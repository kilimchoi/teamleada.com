# == Schema Information
#
# Table name: page_views
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  url            :string(255)
#  controller     :string(255)
#  action         :string(255)
#  parameters     :text
#  properties     :text
#  created_at     :datetime
#  updated_at     :datetime
#  viewed_user_id :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page_view do
  end
end
