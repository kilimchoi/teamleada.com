class Message < ActiveRecord::Base
  obfuscate_id, spin: 100
  belongs_to :conversation
  belongs_to :rich_content, polymorphic: true
end
