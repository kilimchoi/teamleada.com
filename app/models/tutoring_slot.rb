# == Schema Information
#
# Table name: tutoring_slots
#
#  id               :integer          not null, primary key
#  session_datetime :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

class TutoringSlot < ActiveRecord::Base

  COST = 2000

end
