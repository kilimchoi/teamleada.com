# == Schema Information
#
# Table name: slides
#
#  title       :string(255)
#  content     :text
#  parent_id   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  parent_type :string(255)
#  slide_id    :integer
#  uid         :string(255)      not null, primary key
#

class Slide < ActiveRecord::Base
  self.primary_key = "uid"

  serialize :content, Array
  belongs_to :parent, polymorphic: true, primary_key: :uid
  has_many :submission_contexts
  has_many :project_submissions

  before_create :set_uid

  validates_presence_of :slide_id

  default_scope { order('slide_id ASC') }

  def set_uid
    if parent_type == "Step"
      self.uid = "p#{parent.project.uid}_l#{parent.main_lesson.lesson_id}_st#{parent.step_id}_sl#{slide_id}"
    elsif parent_type == "Lesson"
      self.uid = "p#{parent.project.uid}_l#{parent.lesson_id}_sl#{slide_id}"
    end
  end

  def submission_context
    # We only have one submission context per slide for now. This was added for the future when we might
    # want to have more than one submission per slide.
    submission_contexts.first || SubmissionContext.new(
      title: "Quiz Submission",
      description: "",
      slide: self,
      submission_context_id: 0,
      submission_type: SubmissionContext::QUIZ,
    )
  end

  def has_submission_contexts?
    submission_contexts.count > 0
  end

end
