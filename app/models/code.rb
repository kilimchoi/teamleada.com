# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  value       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_type   :string(255)
#  enabled     :boolean          default(TRUE)
#  access_type :string(255)
#

class Code < ActiveRecord::Base
  has_many :user_codes
  has_many :users, through: :user_codes

  validates :access_type, presence: true
  validates :value, uniqueness: true, presence: true
  validates :user_type, presence: true

  default_scope -> { order(:created_at) }

  ACCESS_TYPES = ["project-access"]

  def project_access_created_before?(day)
    # TODO: Don't hard code 'project-access'
    created_at <= day.date.tomorrow && access_type == 'project-access'
  end

end
