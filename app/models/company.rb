class Company < ActiveRecord::Base
  has_many :company_projects
  has_many :projects, through: :company_projects

  validates :name, uniqueness: true, presence: true
end
