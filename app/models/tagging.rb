# == Schema Information
#
# Table name: taggings
#
#  id          :integer          not null, primary key
#  tag_id      :integer
#  tagged_id   :integer
#  tagged_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Tagging < ActiveRecord::Base
end
