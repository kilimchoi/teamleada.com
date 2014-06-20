# == Schema Information
#
# Table name: code_submission_evaluations
#
#  id                 :integer          not null, primary key
#  reviewer_id        :integer
#  reviewee_id        :integer
#  score              :integer
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#  code_submission_id :integer
#

class CodeSubmissionEvaluation < ActiveRecord::Base
  belongs_to :code_submission
  belongs_to :reviewer, class_name: User
  belongs_to :reviewee, class_name: User
  belongs_to :project

  validates :score, presence: true
  validates :description, presence: true
end