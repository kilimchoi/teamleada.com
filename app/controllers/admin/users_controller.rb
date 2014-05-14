class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = @users.paginate(page: params[:page])
  end

  def show
  end

end
