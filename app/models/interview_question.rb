# == Schema Information
#
# Table name: interview_questions
#
#  title            :string(255)
#  difficulty_level :integer
#  question         :text
#  posted_at        :datetime
#  industry         :integer
#  question_type    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  uid              :integer          not null, primary key
#

class InterviewQuestion < ActiveRecord::Base
  obfuscate_id spin: 9987654

  enum industry: [ :data_science ]
  enum question_type: [ :free_response, :code, :multiple_choice ]

  has_many :interview_question_submissions
  has_many :users, through: :interview_question_submissions
end
