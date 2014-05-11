# == Schema Information
#
# Table name: steps
#
#  id               :integer          not null, primary key
#  lesson_id        :integer
#  content          :text
#  previous_step_id :integer
#  next_step_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  title            :string(255)
#  url              :string(255)
#  points           :integer
#

require 'spec_helper'

describe Step do
  pending "add some examples to (or delete) #{__FILE__}"
end
