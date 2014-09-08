class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    unless params[:q].nil? || params[:q].empty?
      @users = @users.search(params[:q])
    end
    @users = @users.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  def show
  end

  def publish_feedback
    @project = Project.find(params[:project_id])
    @evaluations = CodeSubmissionEvaluation.where(reviewee: @user, project: @project)
    @user.publish_evaluations(@project, @evaluations)
    flash[:info] = "You have published feedback for #{@user.name}."
    redirect_to code_submissions_admin_user_path(@user, @project)
  end

  def grant_access
    @project = Project.find(params[:project_id])
    @user.grant_project_access(@project)
    flash[:info] = "Email sent to #{@user.name}"
    redirect_to code_submissions_admin_user_path(@user, @project)
  end

  def deny_access
    @project = Project.find(params[:project_id])
    @user.deny_project_access(@project)
    flash[:info] = "Email sent to #{@user.name}"
    redirect_to code_submissions_admin_user_path(@user, @project)
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

