class InterviewQuestionSubmission < ActiveRecord::Base
  belongs_to :interview_question
  belongs_to :user
end
