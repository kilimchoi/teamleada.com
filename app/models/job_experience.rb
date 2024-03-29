# == Schema Information
#
# Table name: job_experiences
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  summary          :text
#  start_date       :date
#  end_date         :date
#  created_at       :datetime
#  updated_at       :datetime
#  job_id           :integer
#  end_date_present :boolean
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

  # Generate feed stories
  def track_as_story
    if self.new_record? || self.job.changed? || self.company.changed?
      self.track_creation_as_story
    else
      self.track_updates_as_story
    end
  end

  def track_updates_as_story
    UserEditedJobExperienceStory.create_with_user_and_job_experience(user, self)
  end

  def track_creation_as_story
    UserAddedJobExperienceStory.create_with_user_and_job_experience(user, self)
  end

  def all_changes
    self.changes.merge(job.changes).merge(company.changes)
  end

  # Form Interface
  def form_id
    if new_record?
      "add-job-experience"
    else
      "#{self.class.to_s.underscore.gsub('_', '-')}-#{self.id}"
    end
  end

  # Fromatting for the user profile page
  def work_dates
    if start_date
      "#{start_date_formatted} - #{end_date_or_present_formatted} (#{duration})"
    end
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
