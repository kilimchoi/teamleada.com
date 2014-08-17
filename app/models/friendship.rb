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

class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: User

  after_save :update_inverse_friendship

  ACCEPTED = 'accepted'
  DECLINED = 'declined'
  PENDING  = 'pending'

end
