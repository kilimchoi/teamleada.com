# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Subscriber < ActiveRecord::Base
end
