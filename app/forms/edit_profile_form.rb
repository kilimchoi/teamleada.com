class EditProfileForm < Form

  delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile
  delegate :summary, to: :job_experience, prefix: true
  delegate :name, to: :company, prefix: true

  def initialize(user, params={})
    @user = user
    @job_experience = user.job_experiences.find(params[:job_experience_id]) if params[:job_experience_id].present?
    @company = job_experience.company || Company.find_by(name: params[:company_name]) if params[:company_name].present?

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

  def company
    @company ||= Company.new
  end

  def set_attributes(params)
    set_user_profile(params)
    set_job_experience(params)
    set_company(params)
  end

  def set_user_profile(params)
    user_profile.bio                       = params[:bio] if params[:bio].present?
    user_profile.date_of_birth             = params[:date_of_birth] if params[:date_of_birth].present?
    user_profile.location                  = params[:location] if params[:location].present?
    user_profile.looking_for_opportunities = params[:looking_for_opportunities] if params[:looking_for_opportunities].present?
  end

  def set_job_experience(params)
    job_experience.summary = params[:job_experience_summary] if params[:job_experience_summary].present?
    job_experience.user    = @user

    if params[:company_name].present?
      @company = Company.find_by(name: params[:company_name]) || Company.new
    end

    job_experience.company = @company
  end

  def set_company(params)
    company.name = params[:company_name] if params[:company_name].present?
  end

  def save
    # This assumes you can only edit one field at a time which is currently true.
    if @edited_about
      user_profile.save
    elsif @edited_job_experience
      company.save
      job_experience.save
    end
  end

  #
  # Validations
  #

end

