# == Schema Information
#
# Table name: file_submission_contents
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  upload_file            :string(255)
#  required               :boolean          default(TRUE)
#  original_filename      :string(255)
#  upload_file_tmp        :string(255)
#  upload_file_processing :boolean          default(FALSE)
#  type                   :string(255)
#

class CSVSubmissionContent < FileSubmissionContent
end
