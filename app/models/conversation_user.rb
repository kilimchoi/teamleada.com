# == Schema Information
#
# Table name: conversation_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  conversation_id :integer
#  unread          :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

class ConversationUser < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :user_id, uniqueness: { scope: :conversation_id }
end
