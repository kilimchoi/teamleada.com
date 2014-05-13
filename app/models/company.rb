class Company < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
end
