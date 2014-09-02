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

