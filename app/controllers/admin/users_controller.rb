class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    unless params[:q].nil? || params[:q].empty?
      @users = @users.search(params[:q])
    end
    @users = @users.paginate(page: params[:page])
  end

  def show
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
