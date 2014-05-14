# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  role                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  company_id             :integer
#  first_name             :string(255)
#  last_name              :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  has_many :step_status
  has_many :user_codes
  has_many :codes, through: :user_codes
  has_many :transactions

  belongs_to :company

  default_scope -> { order(:created_at) }

  validates_format_of :username, :with => /\A[A-Za-z0-9.&]*\z/
  validates :username, uniqueness: {case_sensitive: false, allow_blank: true}
  validate :check_username
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update

  extend FriendlyId
  friendly_id :username, use: :finders

  self.per_page = 20

  def check_username
    if !self.new_record?
      if username.blank?
        errors.add(:username, "can't be blank")
      end
    end
  end

  def name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      username
    end
  end

  def is_admin?
    role == 'admin'
  end

  def is_company?
    ['recruiter', 'employee'].include? role
  end

  def has_project_access?
    # TODO: Change it so that project-access is not hard-coded
    is_admin? || self.codes.where(group: "project-access").count > 0
  end

  def owns_project?(project)
    return false if !self.is_company? || self.company.nil?
    self.company.projects.include? project
  end

  def has_not_paid_for_project?(project)
    self.transactions.find_by(item: project).nil?
  end

  def completed_projects
    []
  end

  def in_progress_projects
    []
  end

  def completed_points(project)
    total = 0
    step_statuses.each do |step_status|
      if step_status.completed? && step_status.project == project
        total += step_status
      end
    end
    total
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def generate_new_token
    secret = Devise.friendly_token
    new_token = Devise.token_generator.digest(User, :confirmation_token, secret)
    self.confirmation_token = new_token
    self.save(validate: false)
    secret
  end

end
