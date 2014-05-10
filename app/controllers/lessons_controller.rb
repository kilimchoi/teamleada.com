class LessonsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :lesson, through: :project

  def show
  end

end
