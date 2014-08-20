# == Schema Information
#
# Table name: user_profiles
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  looking_for_opportunities :boolean          default(TRUE)
#  location                  :string(255)
#  bio                       :text
#  phone                     :string(255)
#  headline                  :string(255)
#  industry                  :string(255)
#  date_of_birth             :date
#  interests                 :text
#  job_bookmarks_count       :integer
#  country_code              :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#

class UserProfile < ActiveRecord::Base
  belongs_to :user
end
