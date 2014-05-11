# == Schema Information
#
# Table name: slides
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  parent_type :string(255)
#

require 'spec_helper'

describe Slide do
  pending "add some examples to (or delete) #{__FILE__}"
end
