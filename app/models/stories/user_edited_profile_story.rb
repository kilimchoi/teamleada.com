class UserEditedProfileStory < Story

  class << self
    def create_with_user(user)
      UserEditedProfileStory.create(subject: user, object: user.profile)
    end
  end

  def action
  end

  def subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserEditedProfileStory methods
  def user
    subject
  end

  def profile
    object
  end

end

