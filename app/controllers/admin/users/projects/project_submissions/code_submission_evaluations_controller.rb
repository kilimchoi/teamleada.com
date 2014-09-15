class Admin::Users::Projects::ProjectSubmissions::CodeSubmissionEvaluationsController < Admin::Users::Projects::ProjectSubmissions::BaseController
  load_and_authorize_resource :code_submission_evaluation

  def index
    @code_submission_evaluations = @user.evaluations_for_project(@project).where(code_submission: @code_submission)
  end

end
