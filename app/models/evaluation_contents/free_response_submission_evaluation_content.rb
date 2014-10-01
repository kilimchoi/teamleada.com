# == Schema Information
#
# Table name: free_response_submission_evaluation_contents
#
#  id               :integer          not null, primary key
#  computer_science :integer
#  statistics       :integer
#  curiosity        :integer
#  communication    :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class FreeResponseSubmissionEvaluationContent < SubmissionEvaluationContent
end
