class QuestionsController < ApplicationController
  load_resource

  def create
    @question = Question.new(question_params)
    if signed_in?
      @question.asker = current_user
    end
    if @question.save
      flash[:info] = "Your question has successfully been posted."
      redirect_to question_answer_path
    else
      flash[:error] = "There was a problem posting your question."
      redirect_to question_answer_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :up_votes)
  end

end
