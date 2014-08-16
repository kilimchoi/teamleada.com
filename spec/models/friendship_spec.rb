# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  requester_id :integer
#  requestee_id :integer
#  status       :string(255)
#  requested_at :datetime
#  accepted_at  :datetime
#  declined_at  :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Friendship do
  pending "add some examples to (or delete) #{__FILE__}"
end
