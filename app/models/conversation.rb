class Conversation < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :starter, class_name: User
  has_many :conversation_users
  has_many :users, through: :conversation_users
  has_many :messages

  accepts_nested_attributes_for :messages

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

end
