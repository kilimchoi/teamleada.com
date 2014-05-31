class QuestionsController < ApplicationController
  load_resource

  respond_to :html, :js

  def create
    @question = Question.new(question_params)
    @question.vote_from_user(current_user, request.remote_ip)
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

  def up_vote
    @top_questions = Question.top(7)
    @questions = Question.not_including_top(7)
    @question.vote_from_user(current_user, request.remote_ip)
    @question.save
    respond_with @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :up_votes)
  end

end
