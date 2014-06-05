# == Schema Information
#
# Table name: lesson_statuses
#
#  id         :integer          not null, primary key
#  lesson_id  :string(255)
#  user_id    :integer
#  project_id :integer
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe LessonStatus do
  pending "add some examples to (or delete) #{__FILE__}"
end
