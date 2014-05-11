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

require 'spec_helper'

describe Leaderboard do
  pending "add some examples to (or delete) #{__FILE__}"
end
