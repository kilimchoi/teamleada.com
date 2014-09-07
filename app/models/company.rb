# == Schema Information
#
# Table name: companies
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  url                 :string(255)
#  verified            :boolean          default(FALSE)
#  linkedin_company_id :string(255)
#  company_type        :string(255)
#  industry            :string(255)
#  ticker              :string(255)
#

class Company < ActiveRecord::Base
  has_many :browsable_users
  has_many :viewable_users, through: :browsable_users, source: :user

  has_many :company_projects
  has_many :projects, through: :company_projects
  has_many :employees, class_name: User

  has_many :jobs
  has_many :workers, through: :jobs, source: :users

  has_many :user_interactions
  has_many :stories, as: :subject

  # Validations
  validates :name, uniqueness: true, presence: true

  before_create :set_url

  # Scopes
  scope :verified, -> { where(verified: true) }
  scope :unverified, -> { where(verified: false) }

  extend FriendlyId
  friendly_id :url, use: :finders

  # Active Record Callbacks
  def set_url
    self.url = name.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  # Attributes
  def has_data_challenges?
    data_challenges.count > 0
  end

  def favorited_users
    user_ids = user_interactions.where(favorited: true).pluck(:interactee_id).uniq
    User.ordered_find_by_ids(user_ids)
  end

  def data_challenges
    projects.data_challenges
  end

  # Methods

  # TODO(mark): Move this into a finder class
  def self.find_by_company_params(company_params)
    Company.find_by(name: company_params[:company_name])
  end

end

