class Admin::Users::ProjectsController < Admin::Users::BaseController
  load_and_authorize_resource :project

  def publish_feedback
    @evaluations = CodeSubmissionEvaluation.where(reviewee: @user, project: @project)
    @user.publish_evaluations(@project, @evaluations)
    flash[:info] = "You have published feedback for #{@user.name}."
    redirect_to admin_user_project_project_submissions_path(@user, @project)
  end

  def grant_access
    @user.grant_project_access(@project)
    flash[:info] = "Email sent to #{@user.name}"
    redirect_to admin_user_project_project_submissions_path(@user, @project)
  end

  def deny_access
    @user.deny_project_access(@project)
    flash[:info] = "Email sent to #{@user.name}"
    redirect_to admin_user_project_project_submissions_path(@user, @project)
  end

end
