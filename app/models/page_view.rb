# == Schema Information
#
# Table name: page_views
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  url            :string(255)
#  controller     :string(255)
#  action         :string(255)
#  parameters     :text
#  properties     :text
#  created_at     :datetime
#  updated_at     :datetime
#  viewed_user_id :string(255)
#

class PageView < ActiveRecord::Base
  belongs_to :user
  belongs_to :viewed_user, class_name: User,
                           primary_key: :username

  serialize :parameters, Hash
  serialize :properties, Hash
end
