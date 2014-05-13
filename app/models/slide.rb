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

  def set_uid
    #puts "+++++++++ Parent: " + parent_type
    puts "+++++++++ Parent: \"" + parent.title.to_s + "\"' Type: " + parent_type

    if parent_type == "Step"
      self.uid = "p#{parent.project.uid}_l#{parent.lesson.lesson_id}_st#{parent.step_id}_sl#{slide_id}"
      puts self.uid
    elsif parent_type == "Lesson" #technically no stem, so we'll always give it a step of *!
      self.uid = "p#{parent.project.uid}_l#{parent.lesson_id}_st*_sl#{slide_id}"
      puts self.uid
    elsif parent_type == "Project"
      self.uid = "p#{parent.uid}_l*_st*_sl#{slide_id}"
    else
      raise "Uncaught Slide Type"
      #self.uid = "p#{parent.project.uid}_l#{parent.lesson_id}_sl#{slide_id}"
      #puts self.uid
    end
  end
end
