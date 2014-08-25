class SignUpForm < Form

  delegate :email, :first_name, :last_name, :username, :password, :password_confirmation, to: :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validate :validate_email_uniqueness

  validates_format_of :username, with: /\A[A-Za-z0-9_]*\z/
  validate :validate_username_format
  validate :validate_username_uniqueness

  validates :password, { confirmation: true, length: { in: 6..20 } }
  validates :password_confirmation, { length: { in: 6..20 } }

  def user
    @user ||= User.new
  end

  def set_attributes(params)
    user.first_name            = params[:first_name]
    user.last_name             = params[:last_name]
    user.email                 = params[:email]
    user.username              = params[:username]
    user.password              = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.role                  = "student"
  end

  def save
    user.save
    # send email?
    # log some event?
  end

  #
  # Validations
  #
  def validate_email_uniqueness
    if User.exists? email: user.email.downcase
      errors.add(:email, "has already been taken")
    end
  end

  def validate_username_format
    if self.username.nil? || self.username.blank?
      errors.add(:username, "can't be blank")
      return
    end
    if self.username.start_with?("_") || !/^[A-Za-z].*/.match(self.username)
      errors.add(:username, "must start with a letter")
    end
  end

  def validate_username_uniqueness
    if user.username && User.find_by("lower(username) = ?", user.username.downcase)
      errors.add(:username, "has already been taken")
    end
  end

end

