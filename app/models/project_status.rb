# == Schema Information
#
# Table name: project_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  start_date :datetime
#

class ProjectStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  delegate :category, to: :project, allow_nil: true

  scope :group_by_user, -> { order("user_id ASC") }
  default_scope -> { order("updated_at ASC") }

  def set_start_date
    self.start_date = Time.now
    self.save
  end

  def create_user_completed_project_story
    UserCompletedProjectStory.create_with_user_and_project(user, project)
  end

  def create_user_started_project_story
    UserStartedProjectStory.create_with_user_and_project(user, project)
  end

  def begin_project
    if start_date.nil?
      self.set_start_date
      self.create_user_started_project_story
    end
  end

  def mark_complete
    self.completed = true
    self.create_user_completed_project_story
    self.save
  end

  def reset_start_date
    self.start_date = nil
    self.save
  end

  def started?
    !start_date.nil?
  end

  def expired?
    if start_date.nil? || project.deadline.nil?
      false
    else
      Time.now > start_date + project.deadline
    end
  end

  def display_start_date
    "#{start_date.strftime('%A, %B %e, %Y at %l %p')}"
  end

  def display_end_date
    "#{end_date.strftime('%A, %B %e, %Y at %l %p')}"
  end

  def end_date
    unless project.deadline.nil? || start_date.nil?
      start_date + project.deadline
    end
  end

  def end_date_in_milliseconds
    unless project.deadline.nil?
      end_date.to_i * 1000
    end
  end

  def has_time_remaining?
    if project.deadline.nil? || start_date.nil? || completed?
      # If the project doesn't have a deadline, then you always have time remaining.
      return true
    end
    Time.now < end_date
  end

  def completed_all_submissions?
    project.submission_contexts.required.count > 0 && user.unique_required_project_submissions_for_project_count(project) == project.submission_contexts.required.count
  end

  def can_be_graded?
    submissions_required.count > 0
  end

  def fully_graded?
    graded_submissions.count == submissions_required.count
  end

  def feedback_progress
    "#{graded_submissions.count}/#{user_submissions.count} -- #{submissions_required.count} required"
  end

  def graded_submissions
    user_submissions.select{ |code_submission| code_submission.evaluations.count > 0 }
  end

  def user_submissions
    self.user.project_submissions_for_project(self.project)
  end

  def submissions_required
    self.project.submission_contexts.required
  end

  def completed_on
    updated_at.strftime("%B %d, %Y at %l:%M %p")
  end

  # Chart methods
  def created_before_started_and_not_completed?(day)
    created_at <= day.date.tomorrow && started? && !completed?
  end

  def created_before_and_completed?(day)
    created_at <= day.date.tomorrow && completed?
  end

  def created_before_and_started?(day)
    created_at <= day.date.tomorrow && started?
  end
end
