class EditJobExperienceForm < Form

  delegate :summary, to: :job_experience, prefix: true
  delegate :name, to: :company, prefix: true

  validates :company_name, presence: true, if: @edited_job_experience

  def initialize(user, params={})
    @user = user
    @job_experience = user.job_experiences.find(params[:job_experience_id]) if params[:job_experience_id].present?
    @company = job_experience.company || Company.find_by(name: params[:company_name]) if params[:company_name].present?
  end

  def job_experience
    # We don't want to build the association on the user in case the object isn't saved
    @job_experience ||= JobExperience.new
  end

  def company
    @company ||= Company.new
  end

  def set_attributes(params)
    set_job_experience(params)
    set_company(params)
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
    # Must save the company first, otherwise the relationship won't exist for the job_experience
    company.save
    job_experience.save
  end

end

