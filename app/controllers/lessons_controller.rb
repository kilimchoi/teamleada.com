class LessonsController < ApplicationController
  load_and_authorize_resource :project
  load_resource :lesson, through: :project

  def show
    unless can? :show, Lesson
      flash[:warning] = "You must complete the Crime Visualization project to gain access to more projects!"
      redirect_to project_path(Project.grants_project_access.first)
    end

    # TODO: Right now we're giving points to users when they 'start' a lesson
    # We should give them the points when they complete the lesson.
    current_user.complete_lesson(@lesson)

    # For the project deadline countdown
    @project_status = current_user.project_status_for_project(@lesson.project)
    @project_status.begin_project
  end

end
