# == Schema Information
#
# Table name: slides
#
#  title       :string(255)
#  content     :text
#  parent_id   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  parent_type :string(255)
#  slide_id    :integer
#  uid         :string(255)      not null, primary key
#

require 'spec_helper'

describe Slide do
  pending "add some examples to (or delete) #{__FILE__}"
end
