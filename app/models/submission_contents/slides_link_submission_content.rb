# == Schema Information
#
# Table name: slides_link_submission_contents
#
#  id         :integer          not null, primary key
#  content    :text
#  link_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SlidesLinkSubmissionContent < GeneralSubmissionContent
end
