# == Schema Information
#
# Table name: invites
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  invited_email   :string(255)
#  accepted_at     :datetime
#  invited_user_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Invite do
  pending "add some examples to (or delete) #{__FILE__}"
end
