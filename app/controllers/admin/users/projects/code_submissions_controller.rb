class Admin::Users::Projects::CodeSubmissionsController < Admin::Users::Projects::BaseController
  load_and_authorize_resource :code_submission

  def index
    @code_submissions = @user.code_submissions_for_project(@project).paginate(page: params[:page])
  end

  def show
    @evaluation = CodeSubmissionEvaluation.where(code_submission: @code_submission, reviewer: current_user).first_or_initialize
  end

end
