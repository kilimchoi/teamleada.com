class SignUpForm < Form

  delegate :email, to: :user

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  def user
    @user ||= User.new
  end

  def set_attributes(params)
    user.email = params[:email]
    # first_name
    # last_name
  end

  def save
    user.save
  end

  #
  # Validations
  #
  def validate_unique_email
    if User.exists? self.email
      error.add(:email, "has already been taken")
    end
  end

end
