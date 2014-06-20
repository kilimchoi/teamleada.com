# == Schema Information
#
# Table name: code_submission_evaluations
#
#  id                 :integer          not null, primary key
#  reviewer_id        :integer
#  reviewee_id        :integer
#  score              :integer
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#  code_submission_id :integer
#

require 'spec_helper'

describe CodeSubmissionEvaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
