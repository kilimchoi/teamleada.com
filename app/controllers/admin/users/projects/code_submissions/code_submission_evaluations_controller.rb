class Admin::Users::Projects::CodeSubmissions::CodeSubmissionEvaluationsController < Admin::Users::Projects::CodeSubmissions::BaseController
  load_and_authorize_resource :code_submission_evaluation

  def index
    @code_submission_evaluations = @user.evaluations_for_project(@project).where(code_submission: @code_submission)
  end

end
