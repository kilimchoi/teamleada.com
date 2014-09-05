# == Schema Information
#
# Table name: stories
#
#  id                 :integer          not null, primary key
#  subject_id         :integer
#  subject_type       :string(255)
#  type               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  data               :text
#  action_object_id   :integer
#  action_object_type :string(255)
#

class UserSignedUpStory < Story

  class << self
    def create_with_user(user)
      UserSignedUpStory.create(subject: user, action_object: user)
    end
  end

  def subscribers
    # All users who are subscribed to this user
    user.subscribers + additional_subscribers
  end

  def additional_subscribers
    sign_up_user_action = UserAction.find_by(name: "sign_up")
    sign_up_user_action.subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserSignedUpStory methods
  def user
    subject
  end

end
