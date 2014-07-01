class Message < ActiveRecord::Base
  obfuscate_id spin: 12122121

  belongs_to :user
  belongs_to :conversation
  belongs_to :rich_content, polymorphic: true
end
