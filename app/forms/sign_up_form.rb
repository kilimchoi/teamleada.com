class SignUpForm < Form

  delegate :email, to: :user

  def user
    @user ||= User.new
  end

  def set_attributes(params)
    self.email = params[:email]
    # first_name
    # last_name
  end

  def save
  end

  #
  # Validations
  #
  def validate_unique_email
    if User.exists? self.email
      error.add()
    end
  end

end
