class Conversation < ActiveRecord::Base
  obfuscate_id spin: 12

  belongs_to :starter, class_name: User
  has_many :messages
end
