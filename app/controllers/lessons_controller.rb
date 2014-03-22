class LessonsController < ApplicationController
  before_filter :lesson, only: [:show]

  def show
  end

  private

  def lesson
    @lesson = Lesson.find_by(url: params[:url])
  end

end