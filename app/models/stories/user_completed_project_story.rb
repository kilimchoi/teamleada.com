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

class UserCompletedProjectStory < Story

  class << self
    def create_with_user_and_project(user, project)
      UserCompletedProjectStory.create(subject: user, object: project)
    end
  end

  def action
  end

  def subscribers
    # For UserCompletedProjectStories, we want to notify the user_action for:
    #   project_completion
    # as well as all the users who follow this user.
    project_completion_user_action = UserAction.find_by(name: "project_completion")
    project_completion_user_action.subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserCompletedProjectStory methods
  def user
    subject
  end

  def project
    object
  end

end

