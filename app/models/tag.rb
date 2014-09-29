# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer          default(0), not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Tag < ActiveRecord::Base
  has_many :taggings
end
