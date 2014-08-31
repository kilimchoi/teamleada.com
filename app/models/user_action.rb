# == Schema Information
#
# Table name: user_actions
#
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

class UserAction < ActiveRecord::Base
end
