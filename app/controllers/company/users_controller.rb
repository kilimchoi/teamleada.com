class Company::UsersController < Company::BaseController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def show_project
    @project = Project.find(params[:project_id])
    render :show
  end

end
