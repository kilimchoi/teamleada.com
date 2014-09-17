class Admin::Users::Projects::ProjectSubmissions::SubmissionEvaluationsController < Admin::Users::Projects::ProjectSubmissions::BaseController
  load_and_authorize_resource :submission_evaluation

  def index
    @submission_evaluations = @user.evaluations_for_project(@project).where(project_submission: @project_submission)
  end

end
