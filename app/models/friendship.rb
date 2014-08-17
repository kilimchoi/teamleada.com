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

  def update_inverse_friendship
    # NOTE##Frienships
    # Friendships create two objects per real life friendship. There is an after_save
    # callback that checks to see if the inverse relationship exists, and if not, creates
    # it. It also updates the status based on the original friendship's status.
    inverse_friendship = Friendship.find_by(user: friend, friend: user)
    if inverse_friendship.nil?
      # Originally tried .where().first_or_create but it wasn't working well with the
      # after_save callback so instead we're doing the first_or_create logic manually.
      inverse_friendship = Friendship.create(user: friend, friend: user, status: self.status, requested: false)
    elsif inverse_friendship.status != self.status
      inverse_friendship.update_column(status: self.status)
    end
  end

end

