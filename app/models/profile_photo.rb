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
#  photo_processing   :boolean          default(FALSE)
#  photo_tmp          :string(255)
#  photo              :string(255)
#  original_filename  :string(255)
#

class ProfilePhoto < ActiveRecord::Base
  include ::CarrierWave::Backgrounder::Delay
  mount_uploader :photo, ProfilePhotoUploader
  process_in_background :photo
  skip_callback :save, :after, :remove_previously_stored_photo

  belongs_to :user

  default_scope { order(:created_at) }

  def pretty_upload_date
    created_at.strftime("%B %d, %Y")
  end

  def url
    photo_tmp_url || photo.url(:large)
  end

  def photo_tmp_url
    "/tmp/uploads/#{photo_tmp}" unless photo_tmp.nil?
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
    original_filename
  end

end
