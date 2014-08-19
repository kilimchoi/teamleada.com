class SignUpForm < Form

  delegate :email, :first_name, :last_name, to: :user

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validate :validate_unique_email
  validates :first_name, presence: true
  validates :last_name, presence: true

  def user
    @user ||= User.new
  end

  def set_attributes(params)
    user.first_name = params[:first_name]
    user.last_name  = params[:last_name]
    user.email      = params[:email]
  end

  def save
    user.save
    # send email?
    # log some event?
  end

  #
  # Validations
  #
  def validate_unique_email
    if User.exists? email: user.email
      errors.add(:email, "has already been taken")
    end
  end

end
