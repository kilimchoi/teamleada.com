# == Schema Information
#
# Table name: user_actions
#
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

class UserAction < ActiveRecord::Base
  has_many :subscriptions, as: :subscribable
  has_many :user_subscribers, through: :subscriptions, source: :subscriber, source_type: "User"
end
