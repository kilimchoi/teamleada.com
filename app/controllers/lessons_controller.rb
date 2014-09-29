class LessonsController < ApplicationController
  load_and_authorize_resource :project
  load_resource :lesson, through: :project

  def show
    # TODO: Right now we're giving points to users when they 'start' a lesson
    # We should give them the points when they complete the lesson.
    current_user.complete_lesson(@lesson)

    # For the project deadline countdown
    @project_status = current_user.project_status_for_project(@lesson.project)
    @project_status.begin_project
  end

end
