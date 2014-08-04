# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  rich_content_id   :integer
#  rich_content_type :string(255)
#  content           :text
#  is_draft          :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  conversation_id   :integer
#

class Message < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :user
  belongs_to :conversation
  belongs_to :rich_content, polymorphic: true

  after_create :update_conversation

  def update_conversation
    self.conversation.update_last_message_sent_at
    self.conversation.mark_unread_for_everyone_except(self.user)
  end

end
