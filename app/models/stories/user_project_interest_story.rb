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

class UserProjectInterestStory < Story

  class << self
    def create_with_user_and_project(user, project)
      UserProjectInterestStory.create(subject: user, action_object: project)
    end
  end

  def subscribers
    project_interest_user_action = UserAction.find_by(name: "project_interest")
    project_interest_user_action.subscribers
  end

  def permalink_path
    user_story_path(user, self)
  end

  # Specific UserShowedInterestInProjectStory methods
  def user
    subject
  end

  def project
    action_object
  end

end
