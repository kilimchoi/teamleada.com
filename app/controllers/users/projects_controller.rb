class Users::ProjectsController < Users::BaseController
  load_and_authorize_resource :project
  layout Proc.new { ["index"].include?(action_name) ? "users" : "users/projects" }

  def index
    @projects_by_type = @user.projects_by_type
  end

  def show
    @project_status = @user.project_status_for_project(@project)
  end

  def feedback
  end

  def filter
  end

end
