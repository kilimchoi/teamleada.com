# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  value      :string(255)
#  group      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_type  :string(255)
#

class Code < ActiveRecord::Base
  has_many :user_codes
  has_many :users, through: :user_codes

  validates :access_type, presence: true
  validates :value, uniqueness: true, presence: true
  validates :user_type, presence: true

  default_scope -> { order(:created_at) }

  ACCESS_TYPES = ["project-access"]
end
