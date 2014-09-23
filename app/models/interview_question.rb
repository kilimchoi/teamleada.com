class InterviewQuestion < ActiveRecord::Base
  enum industry: [ :data_science ]
  enum question_type: [ :free_response, :code, :multiple_choice ]

  has_many :interview_question_submissions
  has_many :users, through: :interview_question_submissions
end
