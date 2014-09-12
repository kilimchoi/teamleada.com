# == Schema Information
#
# Table name: video_link_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  link_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VideoLinkSubmissionContent < GeneralSubmissionContent
end
