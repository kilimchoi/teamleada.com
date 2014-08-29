class Users::ProjectsController < Users::BaseController
  load_and_authorize_resource :project

  def index
    @completed_projects = @user.completed_projects
    @in_progress_projects = @user.in_progress_projects
  end

  def show
    @project_status = @user.project_status_for_project(@project)
  end

  def feedback
  end

end