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
  has_many :company_subscribers, through: :subscriptions, source: :subscriber, source_type: "Company"

  def subscribers
    [admin_subscriber] + user_subscribers + company_subscribers
  end

  def admin_subscriber
    subscriptions.find_by(subscriber_id: nil, subscriber_type: "admin")
  end

end
