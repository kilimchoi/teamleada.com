# == Schema Information
#
# Table name: interview_question_submissions
#
#  id                    :integer          not null, primary key
#  interview_question_id :integer
#  user_id               :integer
#  content               :text
#  created_at            :datetime
#  updated_at            :datetime
#

require 'spec_helper'

describe InterviewQuestionSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
