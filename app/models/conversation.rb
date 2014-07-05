class Conversation < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :starter, class_name: User
  has_many :conversation_users, dependent: :destroy
  has_many :users, through: :conversation_users
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages

  default_scope -> { order('last_message_sent_at DESC') }

  def update_last_message_sent_at
    self.last_message_sent_at = last_message.created_at

    self.save
  end

  def last_message
    messages.last
  end

  def display_title
    unless title.nil?
      title
    else
      users.pluck(:first_name).to_sentence
    end
  end

  def is_unread?(user)
    self.conversation_users.find_by(user: user).unread?
  end

  # Methods
  def mark_as_read(user)
    conversation_user = self.conversation_users.find_by(user: user)
    conversation_user.unread = false
    conversation_user.save
  end

  def mark_unread_for_everyone_except(user)
    conversation_users.each do |conversation_user|
      unless conversation_user.user == user
        conversation_user.unread = true
        conversation_user.save
      end
    end
  end

  def mark_as_unread_for_users(users)
    conversation_users = self.conversation_users.where(user: users)
    conversation_users.each do |conversation_user|
      conversation_user.unread = true
      conversation_user.save
    end
  end

  def add_users_from_search(search_query)
    names = search_query.split(", ")
    usernames = names.map{ |name| name[/\(.*?\)/][1..-2] }
    usernames.each do |username|
      user = User.find_by(username: username)
      unless user.nil?
        ConversationUser.create(user: user, conversation: self, unread: true)
      end
    end
  end

end
