class SubmissionContent < ActiveRecord::Base
  # Anything the implements this class must have a user, project, and slide.
  self.abstract_class = true

  has_one :project_submission, as: :content

  delegate :user,        to: :project_submission, allow_nil: true
  delegate :project,     to: :project_submission, allow_nil: true
  delegate :slide,       to: :project_submission, allow_nil: true
  delegate :evaluations, to: :project_submission, allow_nil: true
end
