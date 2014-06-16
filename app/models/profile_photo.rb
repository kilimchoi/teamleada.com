class ProfilePhoto < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo,
    storage: :s3,
    s3_credentials: S3_CREDENTIALS,
    path: '/profile_photos/:style/:id/:filename',
    styles: {
      preview: "600x600#",
      large: "300x300#",
      thumb: "160x160#"
    }

  validates_attachment_content_type :photo, content_type: /image/
  validates_attachment_size :photo, less_than: 10.megabytes
end
