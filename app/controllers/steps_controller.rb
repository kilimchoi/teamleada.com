class StepsController < ApplicationController
  before_filter :step, only: [:show]

  def show
  end

  private

  def step
    @step = Step.find_by(url: params[:url])
  end

end
