class Company::UsersController < Company::BaseController
  load_and_authorize_resource

  def index
    @users = @users.paginate(page: params[:page])
  end

  def show
  end

  def show_project
    @project = Project.find(params[:project_id])
    render :show
  end

  def favorite
    user_favorite_user = UserFavoriteUser.where(favoriter: current_user, favoritee: @user).first_or_initialize
    if user_favorite_user.new_record?
      user_favorite_user.company = current_user.company
      if user_favorite_user.save
        respond_to do |format|
          format.json { head :ok }
        end
      else
        respond_to do |format|
          format.json {
            render json: { status: :unprocessable_entity }
          }
        end
      end
    else
      respond_to do |format|
        format.json {
          render json: { message: "You have already favorited #{@user.name}." }
        }
      end
    end
  end

end
