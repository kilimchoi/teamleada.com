class Admin::ProjectSubmissionsController < Admin::BaseController
  load_and_authorize_resource :project_submission

  def index
    if params[:tab] == "completed-projects" || params[:tab] == "by-project"
      if params[:tab] == "completed-projects"
        @project_statuses = ProjectStatus.all.select{ |project_status| project_status.completed && project_status.completed_all_submissions? }
      else
        @project_statuses = ProjectStatus.all
      end
      # TODO: This is inefficient but we need an ActiveRecord relationship to paginate.
      @project_statuses = ProjectStatus.where(id: @project_statuses).group_by_user.paginate(page: params[:page])
    else
      @project_submissions = @project_submissions.paginate(page: params[:page])
    end
  end

end
