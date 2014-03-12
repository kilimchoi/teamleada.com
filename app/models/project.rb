class Project < ActiveRecord::Base
  validates :title, unique: true
end
