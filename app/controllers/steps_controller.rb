class StepsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :lesson, through: :project
  load_and_authorize_resource :step, find_by: :url

  def show
    # TODO: Right now we're giving users points when they 'start' a step.
    # Should give them points when they complete it.
    current_user.complete_step(@step)
  end

end
