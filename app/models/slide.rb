# == Schema Information
#
# Table name: slides
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  parent_type :string(255)
#

class Slide < ActiveRecord::Base
  self.primary_key = "uid"

  serialize :content, Array
  belongs_to :parent, polymorphic: true, primary_key: :uid

  before_create :set_uid

  validates_presence_of :slide_id

  default_scope order('slide_id ASC')

  def set_uid
    if parent_type == "Step"
      self.uid = "p#{parent.project.uid}_l#{parent.main_lesson.lesson_id}_st#{parent.step_id}_sl#{slide_id}"
    elsif parent_type == "Lesson"
      self.uid = "p#{parent.project.uid}_l#{parent.lesson_id}_sl#{slide_id}"
    end
  end
end
