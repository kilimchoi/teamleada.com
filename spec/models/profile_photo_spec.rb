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

require 'spec_helper'

describe ProfilePhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
