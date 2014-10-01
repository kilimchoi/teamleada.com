class Company::Users::ProjectsController < Company::Users::BaseController
  load_and_authorize_resource :project
  # TODO(mark): Why isn't load_and_authorize_resource working...
  before_filter :load_user

  layout "company/users"

  def index
  end

  def show
  end

  private

  def load_user
    @user = User.find_by(username: params[:browse_user_id])
  end

end
