# == Schema Information
#
# Table name: code_submission_contents
#
#  id               :integer          not null, primary key
#  content          :text
#  created_at       :datetime
#  updated_at       :datetime
#  is_complete_code :boolean          default(FALSE)
#

class CodeSubmissionContent < GeneralSubmissionContent
  include ActionView::Helpers::JavaScriptHelper

  default_scope { order(:created_at) }

  def safe_content
    escape_javascript(content.html_safe)
  end

end
