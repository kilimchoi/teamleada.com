class Users::Projects::SubmissionContextsController < Users::Projects::BaseController
  load_and_authorize_resource :submission_context
  before_filter :load_project_submission

  def show
  end

  private

  def load_project_submission
    @project_submission = @user.project_submission_for_submission_context(@submission_context)
  end

end
