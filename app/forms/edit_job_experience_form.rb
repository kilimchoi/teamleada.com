class EditJobExperienceForm < Form

  delegate :name, to: :company, prefix: true
  delegate :summary, :start_date, :end_date, to: :job_experience, prefix: true
  delegate :location, to: :job, prefix: true
  delegate :position_title, to: :job, prefix: true

  validates :company_name, presence: true
  validates :job_position_title, presence: true

  def initialize(user, params={})
    params ||= {}
    @user = user
    @job_experience = user.job_experiences.find(params[:job_experience_id]) if params[:job_experience_id].present?
    @job = job_experience.job || Job.find_by_job_params(params)
    @company = job_experience.company || Company.find_by_company_params(params)
  end

  def job_experience
    # We don't want to build the association on the user in case the object isn't saved
    @job_experience ||= JobExperience.new
  end

  def job
    @job ||= Job.new
  end

  def company
    @company ||= Company.new
  end

  def set_attributes(params)
    set_job_experience(params)
    set_job(params)
    set_company(params)
  end

  def set_job_experience(params)
    job_experience.summary    = params[:job_experience_summary] if params[:job_experience_summary].present?
    job_experience.start_date = Date.from_date_select_params("job_experience_start_date", params) if params["job_experience_start_date(1i)"].present?
    job_experience.end_date   = Date.from_date_select_params("job_experience_end_date", params) if params["job_experience_end_date(1i)"].present?
    job_experience.user       = @user
    job_experience.job        = job
  end

  def set_job(params)
    job.position_title = params[:job_position_title] if params[:job_position_title].present?
    job.location       = params[:job_location] if params[:job_location].present?

    if params[:company_name].present?
      @company = Company.find_by(name: params[:company_name]) || Company.new
    end

    job.company = @company
  end

  def set_company(params)
    company.name = params[:company_name] if params[:company_name].present?
  end

  def save
    # Must save the company first, otherwise the relationship won't exist for the job_experience
    company.save
    job.save
    job_experience.save
  end

end

