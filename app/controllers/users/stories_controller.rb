class Users::StoriesController < Users::BaseController
  load_and_authorize_resource
  layout "users"

  def show
  end

  def index
    @stories = @user.stories
  end

end
