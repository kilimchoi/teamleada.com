class CreateConversationUsers < ActiveRecord::Migration
  def change
    create_table :conversation_users do |t|
      t.references :user
      t.references :conversation
      t.boolean :unread, default: true

      t.timestamps
    end
  end
end
