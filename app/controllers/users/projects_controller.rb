class Users::ProjectsController < Users::BaseController
  load_and_authorize_resource :user
  load_and_authorize_resource :project

  def index
  end

  def show
  end

  def feedback
  end

end
