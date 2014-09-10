class SubmissionEvaluation < ActiveRecord::Base
  belongs_to :reviewer, class_name: User
  belongs_to :reviewee, class_name: User
  belongs_to :project
  belongs_to :project_submission
  belongs_to :content, polymorphic: true
end
