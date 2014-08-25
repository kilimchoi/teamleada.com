class EditJobExperienceForm < Form

  delegate :name, to: :company, prefix: true
  delegate :summary, :start_date, :end_date, :end_date_present, to: :job_experience, prefix: true
  delegate :location, to: :job, prefix: true
  delegate :position_title, to: :job, prefix: true

  attr_accessor :job_experience_start_date_month, :job_experience_start_date_year,
                :job_experience_end_date_month, :job_experience_end_date_year

  validates :company_name, presence: true
  validates :job_position_title, presence: true
  validates :job_experience_start_date, presence: true
  validate :end_date_or_present

  def initialize(user)
    @user = user
  end

  def configure_with_params(params)
    # This is used only for submitting the form with params
    params ||= {}
    @job_experience = @user.job_experiences.find(params[:job_experience_id]) if params[:job_experience_id].present?
    @job = Job.find_by_job_params(params)
    @company = Company.find_by_company_params(params)
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
    set_company(params)
    set_job(params)
    set_job_experience(params)
  end

  def set_job_experience(params)
    job_experience.summary    = params[:job_experience_summary] if params[:job_experience_summary].present?
    job_experience.end_date_present = params[:job_experience_end_date_present] if params[:job_experience_end_date_present].present?

    if params[:job_experience_start_date_month].present? && params[:job_experience_start_date_year].present?
      job_experience.start_date = Date.parse(params[:job_experience_start_date_month] + " " + params[:job_experience_start_date_year])
    end

    # Always reset the end date and if it's still present, it'll be set correctly again
    job_experience.end_date = nil
    if params[:job_experience_end_date_month].present? && params[:job_experience_end_date_year].present?
      job_experience.end_date = Date.parse(params[:job_experience_end_date_month]   + " " + params[:job_experience_end_date_year])
    end

    job_experience.user       = @user
    job_experience.job        = job
  end

  def set_job(params)
    job.position_title = params[:job_position_title] if params[:job_position_title].present?
    job.location       = params[:job_location] if params[:job_location].present?
    job.company = company
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

  #
  # Validations
  #
  def end_date_or_present
    if !job_experience.end_date_present && job_experience.end_date.nil?
      errors.add(:job_experience_start_date_month, "You must provide an end date or mark present.")
    end
  end

end

