class StepsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :lesson, through: :project
  load_and_authorize_resource :step, find_by: :url

  def show
  end

end
