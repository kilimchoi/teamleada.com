class Admin::Users::Projects::CodeSubmissionsController < Admin::Users::Projects::BaseController
  load_and_authorize_resource :code_submission

  def index
    @code_submissions = @user.code_submissions_for_project(@project).paginate(page: params[:page])
  end

  def show
    @evaluation = CodeSubmissionEvaluation.where(code_submission: @code_submission, reviewer: current_user).first_or_initialize
  end

  def evaluate
    @code_submission_evaluation = CodeSubmissionEvaluation.new(evaluation_params)
    @code_submission_evaluation.reviewee = @code_submission.user
    @code_submission_evaluation.reviewer = current_user
    @code_submission_evaluation.code_submission = @code_submission
    @code_submission_evaluation.project = @code_submission.project
    if @code_submission_evaluation.save
      flash[:info] = "Your evalaution was saved."
      redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
    else
      flash[:error] = "There was an error creating your evaluation."
      redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
    end
  end

  def update_evaluation
    @code_submission_evaluation = CodeSubmissionEvaluation.find_by(reviewer: current_user, code_submission: @code_submission)
    if @code_submission_evaluation.update_attributes(evaluation_params)
      flash[:info] = "Your evaluation was updated."
      redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
    else
      flash[:error] = "There was an error updating your evaluation."
      redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
    end
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
