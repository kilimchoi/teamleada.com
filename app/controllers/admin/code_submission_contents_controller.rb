class Admin::CodeSubmissionContentsController < Admin::BaseController
  load_and_authorize_resource except: [:evaluate, :update_evaluation]

  def index
    if params[:tab] == "completed_projects" || params[:tab] == "by_project"
      if params[:tab] == "completed_projects"
        @project_statuses = ProjectStatus.all.select{ |project_status| project_status.completed && project_status.completed_all_submissions? }
      else
        @project_statuses = ProjectStatus.all
      end
      # TODO: This is inefficient but we need an ActiveRecord relationship to paginate.
      @project_statuses = ProjectStatus.where(id: @project_statuses).group_by_user.paginate(page: params[:page])
    else
      @code_submissions = @code_submissions.paginate(page: params[:page])
    end
  end

  def show
    @evaluation = CodeSubmissionEvaluation.where(code_submission: @code_submission, reviewer: current_user).first_or_initialize
  end

end
