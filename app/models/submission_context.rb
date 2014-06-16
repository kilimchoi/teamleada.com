class SubmissionContext < ActiveRecord::Base
  self.primary_key = "uid"

  before_create :set_uid

  belongs_to :slide

  def set_uid
    self.uid = "#{slide.uid}_sc#{submission_context_id}"
  end

end
