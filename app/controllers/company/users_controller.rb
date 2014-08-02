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
    user_interaction = UserInteraction.where(interactor: current_user, interactee: @user).first_or_initialize
    if user_interaction.favorited
      respond_to do |format|
        format.json { render json: { message: "You have already favorited #{@user.name}." } }
      end
    end
    user_interaction.favorited = true
    if user_interaction.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { status: :unprocessable_entity } }
      end
    end
  end

  def unfavorite
    user_interaction = UserInteraction.where(interactor: current_user, interactee: @user).first_or_initialize
    unless user_interaction.favorited
      respond_to do |format|
        format.json { render json: { message: "You have already unfavorited #{@user.name}." } }
      end
    end
    user_interaction.favorited = false
    if user_interaction.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { status: :unprocessable_entity } }
      end
    end
  end

end

