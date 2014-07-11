# == Schema Information
#
# Table name: universities
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  location           :string(255)
#  verified           :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  linkedin_school_id :string(255)
#

require 'spec_helper'

describe University do
  pending "add some examples to (or delete) #{__FILE__}"
end
