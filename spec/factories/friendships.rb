# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  friend_id    :integer
#  status       :string(255)
#  requested_at :datetime
#  accepted_at  :datetime
#  declined_at  :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
  end
end
