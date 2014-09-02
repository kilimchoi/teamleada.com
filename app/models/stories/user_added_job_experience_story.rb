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

  def summary_of_changes
    # TODO(mark): Make this method not super sketchy
    result = ""
    data.each do |key, value|
      result += "<strong>#{key.titleize}:</strong> #{value.last}\n"
    end
    result.chomp
  end

end

end
