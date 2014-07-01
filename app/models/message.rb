class Message < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :user
  belongs_to :conversation
  belongs_to :rich_content, polymorphic: true

  after_create :update_conversation

  def update_conversation
    self.conversation.update_last_message_sent_at
  end

end
