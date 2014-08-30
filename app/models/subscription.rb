# == Schema Information
#
# Table name: subscriptions
#
#  id                :integer          not null, primary key
#  subscriber_id     :integer
#  subscriber_type   :string(255)
#  subscribable_id   :integer
#  subscribable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Subscription < ActiveRecord::Base
  belongs_to :subscriber, polymorphic: true
  belongs_to :subscribable, polymorphic: true
end
