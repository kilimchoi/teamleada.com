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
#  data         :text
#

class Story < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  obfuscate_id spin: 12211221

  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true

  self.inheritance_column = :type

  default_scope -> { order("created_at DESC") }
  scope :user_completed_project_stories, -> { where(type: 'UserCompletedProjectStory') }

  after_create :create_story_notifications

  def action
    raise "Not implemented error"
  end

  def subscribers
    []
  end

  def create_story_notifications
    subscribers.each { |subscriber| StoryNotification.create_with_subscriber_and_story(subscriber, self) }
  end

  def permalink_path
    rails "Not implemented error"
  end

end
