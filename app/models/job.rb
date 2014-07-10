class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_experiences
  has_many :users, through: :job_experiences
end
