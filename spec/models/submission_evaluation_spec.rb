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

require 'spec_helper'

describe SubmissionEvaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
