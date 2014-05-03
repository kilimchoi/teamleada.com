class Code < ActiveRecord::Base
  validates :group, presence: true
  validates :value, uniqueness: true, presence: true
end
