# == Schema Information
#
# Table name: free_response_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class FreeResponseSubmissionContent < GeneralSubmissionContent
  has_one :project_submission, as: :content

  delegate :project, to: :project_submission, allow_nil: true
end
