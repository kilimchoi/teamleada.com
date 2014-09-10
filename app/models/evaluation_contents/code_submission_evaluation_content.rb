# == Schema Information
#
# Table name: code_submission_evaluation_contents
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  computer_science :integer
#  statistics       :integer
#  curiosity        :integer
#  communication    :integer
#

class CodeSubmissionEvaluationContent < ActiveRecord::Base
  has_one :submission_evaluation, as: :content
end
