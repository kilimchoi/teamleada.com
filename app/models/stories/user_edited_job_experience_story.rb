class UserEditedJobExperienceStory < UserEditedProfileStory

  class << self
    def create_with_user_and_job_experience(user, job_experience)
      UserEditedJobExperienceStory.create(subject: user, object: job_experience, data: {  })
    end
  end

end
