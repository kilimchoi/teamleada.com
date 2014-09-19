class Users::Projects::SubmissionContextsController < Users::Projects::BaseController
  load_and_authorize_resource :submission_context, through: :project
  before_filter :load_project_submissions, only: [:show]

  def show
  end

  def index
  end

  private

  def load_project_submissions
    @project_submissions = @user.project_submissions_for_submission_context(@submission_context)
  end

end
