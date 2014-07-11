# == Schema Information
#
# Table name: conversation_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  conversation_id :integer
#  unread          :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe ConversationUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
