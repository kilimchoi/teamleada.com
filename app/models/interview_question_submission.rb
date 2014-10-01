# == Schema Information
#
# Table name: interview_question_submissions
#
#  id                    :integer          not null, primary key
#  interview_question_id :integer
#  user_id               :integer
#  content               :text
#  created_at            :datetime
#  updated_at            :datetime
#

class InterviewQuestionSubmission < ActiveRecord::Base
  include ActionView::Helpers::JavaScriptHelper

  belongs_to :interview_question
  belongs_to :user

  scope :non_admin, -> { where("user_id NOT IN (?)", User.admins.pluck(:id)) }

  def safe_content
    escape_javascript(content.try(:html_safe))
  end
end
