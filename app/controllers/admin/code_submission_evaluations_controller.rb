class Admin::CodeSubmissionEvaluationsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @user = User.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  private

  def evaluation_params
    params.require(:code_submission_evaluation).permit(:description,
                                                       :computer_science,
                                                       :statistics,
                                                       :curiosity,
                                                       :communication)
  end

end
