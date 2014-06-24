# == Schema Information
#
# Table name: impressions
#
#  id                  :integer          not null, primary key
#  impressionable_type :string(255)
#  user_id             :integer
#  controller_name     :string(255)
#  action_name         :string(255)
#  view_name           :string(255)
#  request_hash        :string(255)
#  ip_address          :string(255)
#  session_hash        :string(255)
#  message             :text
#  referrer            :text
#  created_at          :datetime
#  updated_at          :datetime
#  impressionable_id   :string(255)
#

class Impression < ActiveRecord::Base
  include Impressionist::CounterCache
  Impressionist::SetupAssociation.new(self).set
  after_save :impressionable_counter_cache_updatable?

  scope :non_admin, -> { where("user_id NOT IN (?)", [1, 2, 3, 404]) }

  def model
    impressionable_type.constantize
  end

end
