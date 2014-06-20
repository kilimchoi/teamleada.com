class Admin::CodeSubmissionsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def show
    @evaluation = CodeSubmissionEvaluation.new(code_submission: @code_submission)
  end

end
