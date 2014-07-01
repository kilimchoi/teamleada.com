class Conversation < ActiveRecord::Base
  obfuscate_id spin: ENV['SPIN']

  belongs_to :starter, class_name: User
  has_many :conversation_users
  has_many :users, through: :conversation_users
  has_many :messages
end
