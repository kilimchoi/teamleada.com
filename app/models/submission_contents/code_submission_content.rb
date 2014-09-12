# == Schema Information
#
# Table name: code_submission_contents
#
#  id               :integer          not null, primary key
#  content          :text
#  created_at       :datetime
#  updated_at       :datetime
#  is_complete_code :boolean          default(FALSE)
#

class CodeSubmissionContent < GeneralSubmissionContent
  include ActionView::Helpers::JavaScriptHelper

  default_scope { order(:created_at) }

  ADMIN_TABS = ["completed_projects", "all_code_submissions", "by_project"]

  def pretty_submitted_date
    created_at.strftime("%B %d, %Y at %l:%M %p")
  end

  def has_evaluation_by_user?(user)
    code_submission_evaluations.where(reviewer: user).count > 0
  end

  def has_evaluation?
    code_submission_evaluations.count > 0
  end

  def safe_content
    escape_javascript content.html_safe
  end

end
