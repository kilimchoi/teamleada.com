class CodeSubmissionEvaluation < ActiveRecord::Base
  belongs_to :code_submission
  belongs_to :reviewer, class_name: User
  belongs_to :reviewee, class_name: User
end
