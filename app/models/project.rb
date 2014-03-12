class Project < ActiveRecord::Base
  validates :title, unique: true

  def make_url
    self.url = title.gsub(" ", "-")
    self.save
  end

end
