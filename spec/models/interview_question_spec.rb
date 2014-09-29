# == Schema Information
#
# Table name: interview_questions
#
#  title            :string(255)
#  difficulty_level :integer
#  question         :text
#  posted_at        :datetime
#  industry         :integer
#  question_type    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  uid              :integer          not null, primary key
#  multiple_choices :text
#

require 'spec_helper'

describe InterviewQuestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
