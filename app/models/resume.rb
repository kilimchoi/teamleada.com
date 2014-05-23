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

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
  end

end
