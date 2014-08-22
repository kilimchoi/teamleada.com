# == Schema Information
#
# Table name: job_experiences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  summary    :text
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  job_id     :integer
#

class JobExperience < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  has_one :company, through: :job

  delegate :name, to: :company, prefix: true, allow_nil: true
  delegate :position_title, to: :job, allow_nil: true

  default_scope { order("start_date DESC") }

end
