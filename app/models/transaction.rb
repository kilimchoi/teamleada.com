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

class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, polymorphic: true

  def cost_in_dollars
    if amount.nil?
      "$0"
    else
      "$%.2f" % (amount / 100)
    end
  end

end
