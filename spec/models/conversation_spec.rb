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

require 'spec_helper'

describe Conversation do
  pending "add some examples to (or delete) #{__FILE__}"
end
