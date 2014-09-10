# == Schema Information
#
# Table name: free_response_submission_contents
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class FreeResponseSubmissionContent < ActiveRecord::Base
  has_one :project_submission, as: :content

  delegate :project, to: :project_submission, allow_nil: true
end
