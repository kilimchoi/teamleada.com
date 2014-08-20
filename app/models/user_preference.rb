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
  belongs_to :user

end
