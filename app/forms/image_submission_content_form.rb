class ImaageSubmissionContentForm < Form

  delegate :bio, :date_of_birth, :location, :looking_for_opportunities, to: :user_profile

  def initialize(user, project)
    @user = user
    @project = project
  end

  def project_submission
    @project_submission ||= ProjectSubmission.new(user: @user, project: @project)
  end

  def image_submission_content
    @image_submission_content ||= @project_submission.content_object || ImageSubmissionContent.new(project_submission: @project_submission)
  end

  def set_attributes(params)
    user_profile.bio                       = params[:bio] if params[:bio].present?
    user_profile.date_of_birth             = params[:date_of_birth] if params[:date_of_birth].present?
    user_profile.location                  = params[:location] if params[:location].present?
    user_profile.looking_for_opportunities = params[:looking_for_opportunities] if params[:looking_for_opportunities].present?
  end

  def save
    image_submission_content.save
  end

end

