# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  position_title :string(255)
#

require 'spec_helper'

describe Job do
  pending "add some examples to (or delete) #{__FILE__}"
end
