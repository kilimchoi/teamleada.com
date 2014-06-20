class Admin::CodeSubmissionsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def show
    @evaluation = CodeSubmissionEvaluation.where(code_submission: @code_submission, reviewer: current_user).first_or_initialize
  end

  def evaluate
    @code_submission_evaluation = CodeSubmissionEvaluation.new(evaluation_params)
    @code_submission_evaluation.reviewee = @code_submission.user
    @code_submission_evaluation.reviewer = current_user
    @code_submission_evaluation.code_submission = @code_submission
    if @code_submission_evaluation.save
      flash[:info] = "Your evalaution was saved."
      redirect_to admin_code_submission_path(@code_submission)
    else
      flash[:error] = "There was an error creating your evaluation."
      redirect_to admin_code_submission_path(@code_submission)
    end
  end

  def update_evaluation
    @code_submission_evaluation = CodeSubmissionEvaluation.find_by(reviewer: current_user, code_submission: @code_submission)
    if @code_submission_evaluation.update_attributes(evaluation_params)
      flash[:info] = "Your evaluation was updated."
      redirect_to admin_code_submission_path(@code_submission)
    else
      flash[:error] = "There was an error updating your evaluation."
      redirect_to admin_code_submission_path(@code_submission)
    end
  end

  private

  def evaluation_params
    params.require(:code_submission_evaluation).permit(:score, :description)
  end

end
