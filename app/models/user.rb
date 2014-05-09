class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  has_many :step_status
  has_many :user_codes
  has_many :codes, through: :user_codes
  has_many :transactions

  validates_format_of :username, :with => /\A[A-Za-z0-9.&]*\z/
  validates :username, uniqueness: true

  extend FriendlyId
  friendly_id :username, use: :finders

  def is_admin?
    role == 'admin'
  end

  def is_company?
    ['recruiter',].include? role
  end

  def has_project_access?
    # TODO: Change it so that project-access is not hard-coded
    is_admin? || self.codes.where(group: "project-access").count > 0
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

end
