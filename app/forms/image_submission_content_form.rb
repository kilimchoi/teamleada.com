class ImageSubmissionContentForm < Form

  #delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile

  def initialize(user, project)
    @user = user
    @project = project
  end

  def project_submission
    @project_submission ||= ProjectSubmission.new(user: @user, project: @project)
  end

  def image_submission_content
    @image_submission_content ||= ImageSubmissionContent.new(project_submission: project_submission)
  end

  def set_attributes(params)
    image_submission_content.upload_file   = params[:upload_file] if params[:upload_file].present?
  end

  def save
    image_submission_content.save
  end

end

