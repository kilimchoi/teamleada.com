class Users::Projects::SubmissionContextsController < Users::Projects::BaseController
  load_and_authorize_resource :submission_context
  before_filter :load_project_submission, only: [:show]

  def show
  end

  def index
  end

  private

  def load_project_submission
    @project_submission = @user.project_submission_for_submission_context(@submission_context)
  end

end
