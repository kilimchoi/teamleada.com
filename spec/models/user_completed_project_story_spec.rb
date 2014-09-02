# == Schema Information
#
# Table name: stories
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :string(255)
#  object_id    :integer
#  object_type  :string(255)
#  type         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe UserCompletedProjectStory do
  pending "add some examples to (or delete) #{__FILE__}"
end
