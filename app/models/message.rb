class Message < ActiveRecord::Base
  obfuscate_id, spin: ENV['SPIN']

  belongs_to :user
  belongs_to :conversation
  belongs_to :rich_content, polymorphic: true
end
