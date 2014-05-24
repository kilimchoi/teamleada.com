class QuestionsController < ApplicationController
  load_resource


  private

  def question_params
    params.require(:question).permit(:title, :description, :up_votes)
  end
end
