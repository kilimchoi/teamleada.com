# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  item_id          :integer
#  item_type        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  amount           :integer
#  stripe_charge_id :integer
#  charged          :boolean          default(FALSE)
#

require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
