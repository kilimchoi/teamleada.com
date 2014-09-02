# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  position_title :string(255)
#  location       :string(255)
#

class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_experiences
  has_many :users, through: :job_experiences

  def self.find_by_job_params(job_params)
    job_params[:job_location] = nil if job_params[:job_location].blank?
    Job.find_by(position_title: job_params[:job_position_title], location: job_params[:job_location])
  end

end
