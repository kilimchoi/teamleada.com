# == Schema Information
#
# Table name: submission_evaluations
#
#  id                    :integer          not null, primary key
#  reviewer_id           :integer
#  reviewee_id           :integer
#  project_id            :integer
#  project_submission_id :integer
#  body                  :text
#  visible               :boolean
#  content_id            :integer
#  content_type          :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class SubmissionEvaluation < ActiveRecord::Base
  belongs_to :reviewer, class_name: User
  belongs_to :reviewee, class_name: User
  belongs_to :project
  belongs_to :project_submission
  belongs_to :content, polymorphic: true
end
