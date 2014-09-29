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
  belongs_to :tag, counter_cache: true
  belongs_to :tagged, polymorphic: true
end
