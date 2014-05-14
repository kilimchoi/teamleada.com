# == Schema Information
#
# Table name: lessons
#
#  title              :string(255)
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#  previous_lesson_id :integer
#  next_lesson_id     :integer
#  project_id         :integer
#  url                :string(255)
#  lesson_id          :integer
#  uid                :string(255)      not null, primary key
#

require 'spec_helper'

describe Lesson do
  pending "add some examples to (or delete) #{__FILE__}"
end
