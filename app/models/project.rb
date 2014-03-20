class Project < ActiveRecord::Base
  has_many :lessons

  before_create :set_url

  validates :title, uniqueness: true

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

end
