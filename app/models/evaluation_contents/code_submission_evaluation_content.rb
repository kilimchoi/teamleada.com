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
