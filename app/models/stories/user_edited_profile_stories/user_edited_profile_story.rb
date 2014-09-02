class UserEditedProfileStory < Story

  def action
  end

  def subscribers
    # All users who are subscribed to this user
    user.subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserEditedProfileStory methods
  def user
    subject
  end

  def edited_object
    object
  end

end

