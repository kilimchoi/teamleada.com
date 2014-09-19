class ImageSubmissionContentForm < Form

  #delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile

  def initialize(user, project, slide)
    @user = user
    @project = project
    @slide = slide
  end

  def project_submission
    @project_submission ||= ProjectSubmission.new(user: @user, project: @project, slide: @slide)
  end

  def image_submission_content
    @image_submission_content ||= ImageSubmissionContent.new
  end

  def set_attributes(params)
    image_submission_content.upload_file = params[:upload_file] if params[:upload_file].present?

    project_submission.content_object = image_submission_content
  end

  def valid?
    image_submission_content.valid? && project_submission.valid?
  end

  def save
    image_submission_content.save
    project_submission.save
  end

end

