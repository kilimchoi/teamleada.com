# == Schema Information
#
# Table name: story_notifications
#
#  id            :integer          not null, primary key
#  story_id      :integer
#  notified_id   :integer
#  notified_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class StoryNotification < ActiveRecord::Base
  belongs_to :story
  belongs_to :notified, polymorphic: true

  default_scope -> { order("created_at DESC") }

  class << self
    def create_with_subscriber_and_story(subscriber, story)
      StoryNotification.create(notified: subscriber, story: story)
    end
  end

end
