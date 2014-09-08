class Companies::UsersController < Companies::BaseController
  load_and_authorize_resource :user

  def index
  end

  def show
  end

end
