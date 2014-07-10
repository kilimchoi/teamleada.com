# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  rich_content_id   :integer
#  rich_content_type :string(255)
#  content           :text
#  is_draft          :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  conversation_id   :integer
#

require 'spec_helper'

describe Message do
  pending "add some examples to (or delete) #{__FILE__}"
end
