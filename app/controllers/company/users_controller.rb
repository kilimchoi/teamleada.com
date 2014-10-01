class Company::UsersController < Company::BaseController
  load_and_authorize_resource

  layout Proc.new { ["index"].include?(action_name) ? "company" : "company/users" }

  def index
    @users = current_user.company.viewable_users
    @users = @users.paginate(page: params[:page], per_page: User.company_per_page)
  end

  def show
  end

  def show_project
    @project = Project.find(params[:project_id])
  end

  def favorite
    user_interaction = UserInteraction.where(interactor: current_user, interactee: @user).first_or_initialize
    if user_interaction.favorited
      respond_to do |format|
        format.json { render json: { message: "You have already favorited #{@user.name}." } }
      end
    end
    user_interaction.set_favorited
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
    user_interaction.set_unfavorited
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

