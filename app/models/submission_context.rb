# == Schema Information
#
# Table name: submission_contexts
#
#  description           :text
#  submission_context_id :integer
#  slide_id              :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  uid                   :string(255)      not null, primary key
#  title                 :string(255)
#  submission_type       :string(255)
#  project_id            :integer
#  required              :boolean          default(TRUE)
#

class SubmissionContext < ActiveRecord::Base
  self.primary_key = "uid"

  include Rails.application.routes.url_helpers

  validates :title, uniqueness: { scope: :project_id }
  validates :submission_type, presence: true
  validates :slide_id, presence: true

  before_create :set_properties

  extend FriendlyId
  friendly_id :url, use: :finders

  belongs_to :slide
  belongs_to :project

  scope :required, -> { where(required: true) }

  CODE = "code" #code snippets
  COMPLETE_CODE = "complete_code" #complete src code for a project
  RESPONSE = "response" #free response
  PRES_SLIDES_LINK = "presentation_slides_link" #url to the presentation slides
  PRES_VIDEO_LINK = "presentation_vid_linK" #url to the presentation video

  def set_properties
    self.set_uid
    self.set_project
    self.set_url
  end

  def set_uid
    self.uid = "#{slide.uid}_sc#{submission_context_id}"
  end

  def set_project
    self.project_id = self.slide.parent.project.uid
  end

  def set_url
    self.url = title.downcase.gsub(/[^a-z\s]/, '').parameterize
  end

  def path
    item = slide.parent
    if item.is_a? Step
      project_lesson_step_path(project, item.main_lesson, item)
    else
      project_lesson_path(project, item)
    end
  end

  def code_submissions
    project.code_submissions.select{ |code_submission| code_submission.slide == slide }
  end

  def code_submissions_for_user(user)
    code_submissions.select{ |code_submission| code_submission.user == user }
  end

end
