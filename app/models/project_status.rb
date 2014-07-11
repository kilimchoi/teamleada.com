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
#

class ProjectStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  scope :group_by_user, -> { order("user_id ASC") }

  def completed_all_submissions?
    project.submission_contexts.count > 0 && user.code_submissions_for_project(project).count == project.submission_contexts.count
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
    self.user.code_submissions_for_project(self.project).select{ |code_submission| code_submission.code_submission_evaluations.count > 0 }
  end

  def user_submissions
    self.user.code_submissions_for_project(self.project)
  end

  def submissions_required
    self.project.submission_contexts
  end

  def completed_on
    updated_at.strftime("%B %d, %Y at %l:%M %p")
  end

  # Chart methods
  def created_before_and_not_completed?(day)
    created_at <= day.date.tomorrow && !completed?
  end

  def created_before_and_completed?(day)
    created_at <= day.date.tomorrow && completed?
  end

  def created_before?(day)
    created_at <= day.date.tomorrow
  end
end
