# == Schema Information
#
# Table name: user_preferences
#
#  id                             :integer          not null, primary key
#  user_id                        :integer
#  who_can_see_profile            :string(255)
#  who_can_send_friend_requests   :string(255)
#  who_can_contact                :string(255)
#  who_can_lookup_using_email     :string(255)
#  who_can_lookup_by_name         :string(255)
#  who_can_see_resume             :string(255)
#  wants_email_about_new_projects :boolean          default(TRUE)
#  wants_email_from_recruiters    :boolean          default(TRUE)
#  created_at                     :datetime
#  updated_at                     :datetime
#

class UserPreference < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Constants
  SETTINGS_TABS = ['account', 'privacy', 'email']

  PUBLIC = 'Public'
  CONNECTIONS = 'Connections Only'
  RECRUITERS = 'Recruiters Only'
  CONNECTIONS_AND_RECRUITERS = 'Connections & Recruiters'
  ONLY_ME = 'Only Me'

  USER_CATEGORIES = [PUBLIC, CONNECTIONS, RECRUITERS, CONNECTIONS_AND_RECRUITERS, ONLY_ME]
  USER_TYPES = USER_CATEGORIES.map{ |u| [u, u] }

  # Default Values
  default_value_for :who_can_see_profile,          PUBLIC
  default_value_for :who_can_send_friend_requests, PUBLIC
  default_value_for :who_can_contact,              CONNECTIONS_AND_RECRUITERS
  default_value_for :who_can_lookup_using_email,   CONNECTIONS_AND_RECRUITERS
  default_value_for :who_can_lookup_by_name,       CONNECTIONS_AND_RECRUITERS
  default_value_for :who_can_see_resume,           CONNECTIONS_AND_RECRUITERS

end
