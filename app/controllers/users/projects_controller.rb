class Users::ProjectsController < Users::BaseController
  load_and_authorize_resource :project

  def index
    @completed_projects = @user.completed_projects
    @in_progress_projects = @user.in_progress_projects
  end

  def show
  end

  def feedback
  end

end
