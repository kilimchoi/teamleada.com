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
  belongs_to :user

  has_attached_file :resume_file,
    storage: :s3,
    s3_credentials: S3_CREDENTIALS,
    path: '/resumes/:style/:id/:filename',
    styles: {
      preview: "600x600#",
      thumb: "100x100#"
    }

  validates_attachment_content_type :resume_file, content_type: "application/pdf"
  validates_attachment_size :resume_file, less_than: 10.megabytes

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
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
