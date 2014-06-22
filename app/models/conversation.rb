class Conversation < ActiveRecord::Base
  obfuscate_id spin: ENV['SPIN']

  belongs_to :starter, class_name: User
  has_many :messages
end
