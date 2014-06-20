# == Schema Information
#
# Table name: page_views
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  url            :string(255)
#  controller     :string(255)
#  action         :string(255)
#  parameters     :text
#  properties     :text
#  created_at     :datetime
#  updated_at     :datetime
#  viewed_user_id :string(255)
#

require 'spec_helper'

describe PageView do
  pending "add some examples to (or delete) #{__FILE__}"
end
