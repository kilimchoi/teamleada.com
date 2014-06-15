# == Schema Information
#
# Table name: launches
#
#  day_id     :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

class Launch < ActiveRecord::Base
end
