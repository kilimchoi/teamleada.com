class Lesson < ActiveRecord::Base
  belongs_to :project
  has_many :steps

  has_one :next_lesson
  has_one :previous_lesson
end
