class StepsController < ApplicationController
  before_filter :step, only: [:show]

  def show
  end

  private

  def step
    @step = Step.find(params[:id])
  end

end
