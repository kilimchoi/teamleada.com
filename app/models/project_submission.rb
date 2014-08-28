# == Schema Information
#
# Table name: project_submissions
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProjectSubmission < ActiveRecord::Base
  include ::CarrierWave::Backgrounder::Delay
  mount_uploader :upload_file, ProjectSubmissionUploader
  process_in_background :upload_file
  skip_callback :save, :after, :remove_previously_stored_upload_file

  belongs_to :project
  belongs_to :user

  belongs_to :user

  default_scope { order(:created_at) }

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
  end

  def url
    resume_file_tmp_url || resume_file.url
  end

  def resume_file_tmp_url
    "/tmp/uploads/#{resume_file_tmp}" unless resume_file_tmp.nil?
  end

  def first_name
    user.first_name
  end

  def last_name
    user.last_name
  end

  def version
    user.resumes.index(self) + 1
  end

  def filename
    original_filename
  end

end
