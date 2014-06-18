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
#

class SubmissionContext < ActiveRecord::Base
  self.primary_key = "uid"

  before_create :set_uid

  belongs_to :slide

  def set_uid
    self.uid = "#{slide.uid}_sc#{submission_context_id}"
  end

end
