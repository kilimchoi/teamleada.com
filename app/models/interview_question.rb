class InterviewQuestion < ActiveRecord::Base
  has_many :interview_question_submissions
  has_many :users, through: :interview_question_submissions
end
