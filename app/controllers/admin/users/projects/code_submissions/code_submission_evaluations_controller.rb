class Admin::Users::Projects::CodeSubmissions::CodeSubmissionEvaluationsController < Admin::Users::Projects::CodeSubmissions::BaseController
  load_and_authorize_resource :code_submission_evaluation

  def index

  end

end
