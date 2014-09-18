class StepsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :lesson, through: :project
  load_and_authorize_resource :step, through: :lesson

  def show
    # TODO: Right now we're giving users points when they 'start' a step.
    # Should give them points when they complete it.
    current_user.complete_step(@step)

    # For the project deadline countdown
    @project_status = current_user.project_status_for_project(@step.project)
  end

end
