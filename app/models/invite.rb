class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :invited_user, class_name: User

  INVITES = 3

  def accepted?
    !invited_user.nil?
  end

end
