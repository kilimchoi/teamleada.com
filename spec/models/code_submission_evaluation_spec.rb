# == Schema Information
#
# Table name: code_submission_evaluations
#
#  id                 :integer          not null, primary key
#  reviewer_id        :integer
#  reviewee_id        :integer
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#  code_submission_id :integer
#  project_id         :integer
#  computer_science   :integer
#  statistics         :integer
#  curiosity          :integer
#  communication      :integer
#  visible            :boolean          default(FALSE)
#

require 'spec_helper'

describe CodeSubmissionEvaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
