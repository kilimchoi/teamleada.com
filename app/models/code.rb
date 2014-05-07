class Code < ActiveRecord::Base
  has_many :user_codes
  has_many :users, through: :user_codes

  validates :group, presence: true
  validates :value, uniqueness: true, presence: true
  validates :user_type, presence: true

  GROUPS = ["project-access"]
end
