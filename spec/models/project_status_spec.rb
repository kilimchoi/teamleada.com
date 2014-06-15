# == Schema Information
#
# Table name: project_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ProjectStatus do
  pending "add some examples to (or delete) #{__FILE__}"
end
