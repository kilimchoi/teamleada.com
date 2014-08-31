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

  has_many :singleton_subscribers, through: :subscriptions, source: :subscriber, source_type: "Subscriber"
  has_many :user_subscribers, through: :subscriptions, source: :subscriber, source_type: "User"
  has_many :company_subscribers, through: :subscriptions, source: :subscriber, source_type: "Company"

  def subscribers
    admin_subscribers + user_subscribers + company_subscribers
  end

  def admin_subscribers
    singleton_subscribers.where(name: "admin")
  end

end
