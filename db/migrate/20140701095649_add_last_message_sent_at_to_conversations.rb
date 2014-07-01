class AddLastMessageSentAtToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :last_message_sent_at, :datetime
  end
end
