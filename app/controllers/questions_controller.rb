class QuestionsController < ApplicationController
  load_resource

  respond_to :html, :js

  def create
    @question = Question.new(question_params)
    @question.up_votes = 1
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
    @questions = Question.all
    if signed_in?
      @question.voters.push(current_user.current_sign_in_ip)
      # Using up_votes as a pseudo counter cache for .voters
      @question.up_votes += 1
      @question.save
    end
    respond_with @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :up_votes)
  end

end
