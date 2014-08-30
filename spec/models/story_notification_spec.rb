# == Schema Information
#
# Table name: story_notifications
#
#  id            :integer          not null, primary key
#  story_id      :integer
#  notified_id   :integer
#  notified_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe StoryNotification do
  pending "add some examples to (or delete) #{__FILE__}"
end
