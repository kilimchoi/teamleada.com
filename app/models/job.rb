# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  position_title :string(255)
#

class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_experiences
  has_many :users, through: :job_experiences
end
