# == Schema Information
#
# Table name: steps
#
#  lesson_id        :string(255)
#  content          :text
#  previous_step_id :string(255)
#  next_step_id     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  title            :string(255)
#  url              :string(255)
#  points           :integer
#  step_id          :integer
#  uid              :string(255)      not null, primary key
#

require 'spec_helper'

describe Step do
  pending "add some examples to (or delete) #{__FILE__}"
end
