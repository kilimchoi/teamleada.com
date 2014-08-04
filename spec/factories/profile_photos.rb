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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile_photo do
  end
end
