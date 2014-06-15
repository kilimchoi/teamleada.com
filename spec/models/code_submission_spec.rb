# == Schema Information
#
# Table name: code_submissions
#
#  id          :integer          not null, primary key
#  content     :text
#  user_id     :integer
#  project_id  :integer
#  parent_id   :string(255)
#  parent_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  slide_index :integer
#

require 'spec_helper'

describe CodeSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
