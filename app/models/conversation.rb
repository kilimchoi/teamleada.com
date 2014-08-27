# == Schema Information
#
# Table name: conversations
#
#  id                   :integer          not null, primary key
#  starter_id           :integer
#  title                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  last_message_sent_at :datetime
#

class Conversation < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :starter, class_name: User
  has_many :conversation_users, dependent: :destroy
  has_many :users, through: :conversation_users
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages

  default_scope -> { order('last_message_sent_at DESC') }
  self.per_page = 25

  def update_last_message_sent_at
    self.last_message_sent_at = last_message.created_at
    self.save
  end

  def last_message
    messages.last
  end

  def last_message_content
    "#{last_message.user.first_name}: #{last_message.content}"
  end

  def display_title(user)
    if !title.nil?
      title
    elsif users.count == 2
      other_users(user).first.name
    else
      users.pluck(:first_name).to_sentence
    end
  end

  def other_users(user)
    users.where('users.id != ?', user.id)
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
    # TODO(mark): This is hacky, we should instead grab the ids and send them in the query somehow.
    names = search_query.split(", ")
    # usernames = names.map{ |name| name[/\(.*?\)/][1..-2] }
    names.each do |name|
      # This will only work because we limited the users by a lot
      user = User.find_by(name: name)
      if !user.nil? && [1, 2, 3].include?(user.id)
        ConversationUser.create(user: user, conversation: self, unread: true)
      else
        return false
      end
    end
  end

  def create_conversation_users(users)
    users.each do |user|
      ConversationUser.create(user: user, conversation: self, unread: true)
    end
  end

  def self.create_separate_conversations(conversation_params, sender, users)
    users.each do |user|
      conversation = Conversation.new(conversation_params)
      conversation.starter = sender
      ConversationUser.create(user: sender, conversation: conversation, unread: false)
      ConversationUser.create(user: user, conversation: conversation, unread: true)
      conversation.save
    end
  end

end
