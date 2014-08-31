# == Schema Information
#
# Table name: user_actions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserAction < ActiveRecord::Base
end
