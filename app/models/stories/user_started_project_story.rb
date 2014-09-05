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

class UserStartedProjectStory < Story

  class << self
    def create_with_user_and_project(user, project)
      UserStartedProjectStory.create(subject: user, action_object: project)
    end
  end

  def action
  end

  def subscribers
    # For UserStartedProjectStories, we want to notify the user_action for:
    #   project_start
    # as well as all the users who follow this user.
    project_start_user_action = UserAction.find_by(name: "project_start")
    project_start_user_action.subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserStartedProjectStory methods
  def user
    subject
  end

  def project
    action_object
  end

end
