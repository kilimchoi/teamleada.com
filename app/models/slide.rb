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
  belongs_to :parent, polymorphic: true

  default_scope { order('slide_id') }

  before_create :set_uid

  validates_presence_of :slide_id

  def set_uid
    self.uid = "p#{project_id}_l#{lesson_id}_#{parent_type}#{parent_id}_sl#{slide_id}"
  end
end
