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
  belongs_to :interview_question
  belongs_to :user
end
