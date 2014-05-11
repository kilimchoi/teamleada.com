# == Schema Information
#
# Table name: step_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  step_id    :integer
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

require 'spec_helper'

describe StepStatus do
  pending "add some examples to (or delete) #{__FILE__}"
end
