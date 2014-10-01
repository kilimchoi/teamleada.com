# == Schema Information
#
# Table name: project_submissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  slide_id     :string(255)
#  content_id   :integer
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe ProjectSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
