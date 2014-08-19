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
#  url                 :string(255)
#  user_agent          :string(255)
#

class Impression < ActiveRecord::Base
  include Impressionist::CounterCache
  Impressionist::SetupAssociation.new(self).set

  self.per_page = 50

  DAILY = "daily"
  WEEKLY = "weekly"
  MONTHLY = "monthly"
  TIMEFRAMES = [DAILY, WEEKLY, MONTHLY]

  CATEGORIES = ["projects"]

  belongs_to :user

  after_save :impressionable_counter_cache_updatable?

  default_scope { order("created_at DESC") }
  scope :non_admin, -> { where(user_id: nil) + where("user_id NOT IN (?)", User.admins.pluck(:id)) }

  # By timeframe
  scope :daily, -> (day) { where("created_at >= ?", day.to_date) }
  scope :weekly, -> (beginning_of_week) { where("created_at >= ?", beginning_of_week.to_date) }

  # By category
  scope :projects, -> { where(controller_name: "projects") }

  class << self

    def filter_timeframe(timeframe, start_date)
      case timeframe
      when DAILY
        self.daily(start_date)
      when WEEKLY
        self.weekly(start_date)
      when MONTHLY
        self.monthly(start_date)
      else
        self.all
      end
    end

    def filter_category(category)
      case category
      when "projects"
        self.projects
      else
        self.all
      end
    end

  end

  def model
    impressionable_type.constantize
  end

end

