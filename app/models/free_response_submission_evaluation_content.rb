class FreeResponseSubmissionEvaluationContent < ActiveRecord::Base
  has_one :submission_evaluation, as: :content
end
