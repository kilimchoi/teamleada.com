# == Schema Information
#
# Table name: project_submissions
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  upload_file :string(255)
#

require 'spec_helper'

describe ProjectSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
