class StepsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :lesson, through: :project
  load_and_authorize_resource :step, through: :lesson

  def show
  end

end
