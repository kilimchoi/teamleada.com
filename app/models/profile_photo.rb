# == Schema Information
#
# Table name: profile_photos
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class ProfilePhoto < ActiveRecord::Base
  include ::CarrierWave::Backgrounder::Delay
  mount_uploader :profile_photo_file, ResumeUploader
  store_in_background :profile_photo_file
  skip_callback :save, :after, :remove_previously_stored_profile_photo_file

  belongs_to :user

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
    user.profile_photos.index(self) + 1
  end

  def filename
    photo_file_name
  end

end
