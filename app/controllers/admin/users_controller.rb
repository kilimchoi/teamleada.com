class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource
  layout Proc.new { ["index"].include?(action_name) ? "admin" : "admin/users" }

  helper_method :sort_column, :sort_direction

  def index
    unless params[:q].nil? || params[:q].empty?
      @users = @users.search(params[:q])
    end
    @users = @users.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  def show
  end

  def activity
    @page_views = @user.page_views.most_recent.paginate(page: params[:page])
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

