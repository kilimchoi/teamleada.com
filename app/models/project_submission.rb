# == Schema Information
#
# Table name: project_submissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  slide_id     :integer
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ProjectSubmission < ActiveRecord::Base
  include ::CarrierWave::Backgrounder::Delay
  mount_uploader :upload_file, ProjectSubmissionUploader
  process_in_background :upload_file
  skip_callback :save, :after, :remove_previously_stored_upload_file

  belongs_to :project
  belongs_to :user

  default_scope { order(:created_at) }

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
  end

  def url
    upload_file_tmp_url || upload_file.url
  end

  def upload_file_tmp_url
    "/tmp/uploads/#{upload_file_tmp}" unless upload_file_tmp.nil?
  end

  def version
    user.project_submissions.index(self) + 1
  end

  def filename
    original_filename
  end

end
