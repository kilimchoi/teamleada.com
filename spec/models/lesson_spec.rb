# == Schema Information
#
# Table name: lessons
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#  previous_lesson_id :integer
#  next_lesson_id     :integer
#  project_id         :integer
#  url                :string(255)
#

require 'spec_helper'

describe Lesson do
  pending "add some examples to (or delete) #{__FILE__}"
end
