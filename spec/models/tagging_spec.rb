# == Schema Information
#
# Table name: taggings
#
#  id          :integer          not null, primary key
#  tag_id      :integer
#  tagged_id   :integer
#  tagged_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Tagging do
  pending "add some examples to (or delete) #{__FILE__}"
end
