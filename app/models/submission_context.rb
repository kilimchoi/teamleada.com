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
#

class SubmissionContext < ActiveRecord::Base
  self.primary_key = "uid"

  validates :submission_type, presence: true
  validates :slide_id, presence: true

  before_create :set_properties

  belongs_to :slide
  belongs_to :project

  CODE = "code" #code snippets
  COMPLETE_CODE = "complete_code" #complete src code for a project 
  RESPONSE = "response" #free response
  PRES_SLIDES_LINK = "presentation_slides_link" #url to the presentation slides
  PRES_VIDEO_LINK = "presentation_vid_linK" #url to the presentation video

  def set_properties
    self.set_uid
    self.set_project
  end

  def set_uid
    self.uid = "#{slide.uid}_sc#{submission_context_id}"
  end

  def set_project
    self.project_id = self.slide.parent.project.uid
  end

end
