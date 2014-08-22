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
  include ActionView::Helpers::DateHelper

  belongs_to :user
  belongs_to :job

  has_one :company, through: :job

  delegate :name, to: :company, prefix: true, allow_nil: true

  delegate :position_title, to: :job, allow_nil: true
  delegate :location,       to: :job, allow_nil: true

  default_scope { order("start_date DESC") }

  # Fromatting for the user profile page
  def work_dates
    "#{start_date_formatted} - #{end_date_or_present_formatted} (#{duration})"
  end

  def duration
    distance_of_time_in_words(start_date, end_date_or_present)
  end

  def end_date_or_present
    end_date || Date.today
  end

  def end_date_or_present_formatted
    end_date ? end_date.month_and_year : "Present"
  end

  def start_date_formatted
    start_date.month_and_year
  end

end
