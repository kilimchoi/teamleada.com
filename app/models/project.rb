class Project < ActiveRecord::Base
  before_create :make_url

  validates :title, uniqueness: true

  def make_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

end
