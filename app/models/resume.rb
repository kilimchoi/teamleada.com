# == Schema Information
#
# Table name: resumes
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  created_at               :datetime
#  updated_at               :datetime
#  resume_file_file_name    :string(255)
#  resume_file_content_type :string(255)
#  resume_file_file_size    :integer
#  resume_file_updated_at   :datetime
#

class Resume < ActiveRecord::Base
  include ::CarrierWave::Backgrounder::Delay
  mount_uploader :resume_file, ResumeUploader
  store_in_background :resume_file
  skip_callback :save, :after, :remove_previously_stored_resume_file

  belongs_to :user

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
  end

  def url
    resume_file_tmp || resume_file.url
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
    resume_file_file_name
  end

end
