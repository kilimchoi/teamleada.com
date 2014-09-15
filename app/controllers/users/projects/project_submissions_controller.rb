class Users::Projects::ProjectSubmissionsController < Users::Projects::BaseController
  load_and_authorize_resource :project_submissions

  def show
  end

  def index
  end

  def create
    @project_submission = ProjectSubmission.new(project_submission_params)
  end

  private

  def project_submission_params
    params.require(:project_submission).permit(:id, :upload_file)
  end

end
