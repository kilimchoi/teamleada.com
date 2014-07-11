# == Schema Information
#
# Table name: quiz_submissions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  quiz_id          :integer
#  submitted_answer :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe QuizSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
