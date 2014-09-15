class ImageSubmissionContentForm < Form

  #delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile

  def initialize(user, project, slide)
    @user = user
    @project = project
    @slide = slide
  end

  def image_submission_content
    @image_submission_content ||= ImageSubmissionContent.new
  end

  def set_attributes(params)
    image_submission_content.upload_file   = params[:upload_file] if params[:upload_file].present?
  end

  def save
    image_submission_content.save
  end

end

