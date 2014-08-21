class EditProfileForm < Form

  delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile
  delegate :summary, to: :job_experience, prefix: true

  def initialize(user, params={})
    @user = user
    @job_experience = user.job_experiences.find(params[:job_experience_id]) if params[:job_experience_id].present?

    @edited_about = params[:edited_about]
    @edited_job_experience = params[:edited_job_experience]
  end

  def user_profile
    @user_profile ||= @user.profile
  end

  def job_experience
    # We don't want to build the association on the user in case the object isn't saved
    @job_experience ||= JobExperience.new
  end

  def set_attributes(params)
    user_profile.bio                       = params[:bio] || user_profile.bio
    user_profile.date_of_birth             = params[:date_of_birth] || user_profile.date_of_birth
    user_profile.location                  = params[:location] || user_profile.location
    user_profile.looking_for_opportunities = params[:looking_for_opportunities] || user_profile.looking_for_opportunities

    job_experience.summary                 = params[:job_experience_summary] || job_experience.summary
    job_experience.user                    = @user
  end

  def save
    # This assumes you can only edit one field at a time which is currently true.
    if @edited_about
      user_profile.save
    elsif @edited_job_experience
      job_experience.save
    end
  end

  #
  # Validations
  #

end

