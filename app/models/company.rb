# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  url        :string(255)
#

class Company < ActiveRecord::Base
  has_many :company_projects
  has_many :projects, through: :company_projects
  has_many :employees, class_name: User

  validates :name, uniqueness: true, presence: true

  before_create :set_url

  extend FriendlyId
  friendly_id :url, use: :finders

  def set_url
    self.url = name.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

end
