class SubmissionEvaluationContent < ActiveRecord::Base
  self.abstract_class = true

  has_one :submission_evaluation, as: :content

  delegate :reviewer, to: :submission_evaluation, allow_nil: true
  delegate :reviewee, to: :submission_evaluation, allow_nil: true
  delegate :body,     to: :submission_evaluation, allow_nil: true
end
