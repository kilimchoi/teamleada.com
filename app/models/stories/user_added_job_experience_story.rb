class UserAddedJobExperienceStory < UserEditedProfileStory

  class << self
    def create_with_user_and_job_experience(user, job_experience)
      UserAddedJobExperienceStory.create(
        subject: user,
        action_object: job_experience,
        data: job_experience.changes,
      )
    end
  end

  def additional_subscribers
    added_job_experience_user_action = UserAction.find_by(name: "user_added_job_experience")
    added_job_experience_user_action.subscribers
  end

  def job_experience
    action_object
  end

end

