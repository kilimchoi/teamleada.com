class Admin::UsersController < Admin::BaseController
  before_filter :users, only: [:index]
  before_filter :user, only: [:show]

  def index
  end

  def show
  end

  private

  def users
    @users = User.all
  end

  def user
    @user = User.find_by(username: params[:username])
  end

end
