# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  project_id :integer
#  baseline   :decimal(20, 5)
#  created_at :datetime
#  updated_at :datetime
#

class Leaderboard < ActiveRecord::Base
end
