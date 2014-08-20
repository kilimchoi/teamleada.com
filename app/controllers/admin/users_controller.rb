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

  def show_code_submissions
    @project = Project.find(params[:project_id])
    @code_submissions = @user.code_submissions_for_project(@project).paginate(page: params[:page])
  end

  def show_code_submission
    @code_submission = CodeSubmission.find(params[:code_submission_id])
    @evaluation = CodeSubmissionEvaluation.where(code_submission: @code_submission, reviewer: current_user).first_or_initialize
  end

  def publish_feedback
    @project = Project.find(params[:project_id])
    @evaluations = CodeSubmissionEvaluation.where(reviewee: @user, project: @project)
    @user.publish_evaluations(@project, @evaluations)
    flash[:info] = "You have published feedback for #{@user.name}."
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

