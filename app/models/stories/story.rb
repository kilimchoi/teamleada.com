# == Schema Information
#
# Table name: stories
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :string(255)
#  object_id    :integer
#  object_type  :string(255)
#  type         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Story < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true

  self.inheritance_column = :type

  default_scope -> { order("created_at DESC") }
  scope :user_completed_project_stories, -> { where(type: 'UserCompletedUserStory') }

  def action
    raise "Not implemented error"
  end

end
