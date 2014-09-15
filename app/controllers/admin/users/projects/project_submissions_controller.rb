class Admin::Users::Projects::ProjectSubmissionsController < Admin::Users::Projects::BaseController
  load_and_authorize_resource :project_submission

  def index
    @project_submissions = @user.project_submissions_for_project(@project).paginate(page: params[:page])
  end

  def show
    @evaluation_content_object = @project_submission.first_or_initialize_evaluation_content_object_for_reviewer(current_user)
  end

  def evaluate
    @code_submission_evaluation = CodeSubmissionEvaluation.new(evaluation_params)
    @code_submission_evaluation.reviewee = @code_submission.user
    @code_submission_evaluation.reviewer = current_user
    @code_submission_evaluation.code_submission = @code_submission
    @code_submission_evaluation.project = @code_submission.project
    if @code_submission_evaluation.save
      flash[:info] = "Your evalaution was saved."
    else
      flash[:error] = "There was an error creating your evaluation."
    end
    redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
  end

  def update_evaluation
    @code_submission_evaluation = CodeSubmissionEvaluation.find_by(reviewer: current_user, code_submission: @code_submission)
    if @code_submission_evaluation.update_attributes(evaluation_params)
      flash[:info] = "Your evaluation was updated."
    else
      flash[:error] = "There was an error updating your evaluation."
    end
    redirect_to admin_user_project_code_submissions_path(@code_submission.user, @code_submission.project)
  end

  private

  def evaluation_params
    params.require(:submission_evaluation).permit(:description,
                                                  :computer_science,
                                                  :statistics,
                                                  :curiosity,
                                                  :communication,
    )
  end

end
