class Resume < ActiveRecord::Base
  belongs_to :user

  has_attached_file :resume_file, styles: { preview: "600x600#", thumb: "100x100#" }
  validates_attachment_content_type :resume_file, content_type: "application/pdf"
end
