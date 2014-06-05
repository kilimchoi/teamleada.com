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

class LessonStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :project
end
