# == Schema Information
#
# Table name: quiz_submissions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  quiz_id          :integer
#  submitted_answer :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class QuizSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
end
