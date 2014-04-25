class QuizzesController < ApplicationController
	before_filter :quizzes, only: [:index]

 def check_answer
  @result = Quiz.find_by_quiz_id(params[:quiz_id])
    if @result == params[:user_input] #if answer is same as what user inputed @TODO clean user input.
      render :text => "correct"
    else
      render :text => @result
    end
  end


  def quiz
    @quiz = Quiz.find_by(url: params[:url] || params[:project_url])
  end

  def quizzes
    @quizzes = Quiz.all
  end

end
