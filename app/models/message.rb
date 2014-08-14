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
  after_create :send_email_if_allowed

  def update_conversation
    self.conversation.update_last_message_sent_at
    self.conversation.mark_unread_for_everyone_except(self.user)
  end

  def send_email_if_allowed
    other_users.each do |user|
      # Change this condition later on
      if user.wants_email_about_new_projects
        MessageMailer.message_email(self, self.user, user).deliver
      end
    end
  end

  # Properties
  def other_users
    conversation.other_users(user)
  end

end
