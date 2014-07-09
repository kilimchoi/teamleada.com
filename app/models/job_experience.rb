class JobExperience < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  has_one :company, through: :job
end
