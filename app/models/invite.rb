class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :invited_user, class_name: User

  INVITES = 3

  validates :invited_email, presence: true,
                            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
                            uniqueness: true

  def accepted?
    !invited_user.nil? && invited_user.confirmed? ? "Yes" : "No"
  end

  def pretty_created_at_date
    created_at.strftime("%B %d, %Y")
  end

  def send_user_invite!(current_user)
    current_user.invites << self
    @user = User.new(email: self.invited_email)
    @user.skip_confirmation!
    @user.save(validate: false)
    @user.unconfirm!
    self.invited_user = @user
    self.save
    InviteMailer.invite_email(self).deliver
  end

  # Chart Methods
  def invited_user_created_before?(day)
    !accepted_at.nil? && accepted_at <= day.date.tomorrow
  end

  def invite_sent_before?(day)
    created_at <= day.date.tomorrow
  end

end
