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
  belongs_to :code_submission
  belongs_to :reviewer, class_name: User
  belongs_to :reviewee, class_name: User
  belongs_to :project

  has_one :submission_evaluation, as: :content

  validates :description, presence: true

  scope :published, -> { where(visible: true) }

  def pretty_created_at
    created_at.strftime("%B %d, %Y")
  end

end
