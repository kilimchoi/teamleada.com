class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :invited_user, class_name: User

  INVITES = 3

  validates :invited_email, presence: true,
                            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
                            uniqueness: true

  def accepted?
    !invited_user.nil?
  end

  def send_user_invite!
    InviteMailer.invite_email(self).deliver
  end

end
