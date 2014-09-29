# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Tag < ActiveRecord::Base
end
