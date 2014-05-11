# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  score      :decimal(20, 5)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Submission do
  pending "add some examples to (or delete) #{__FILE__}"
end
