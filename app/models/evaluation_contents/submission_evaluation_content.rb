class SubmissionEvaluationContent < ActiveRecord::Base
  self.abstract_class = true

  has_one :submission_evaluation, as: :content_object
end
