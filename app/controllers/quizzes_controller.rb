class QuizzesController < ApplicationController
  before_filter :quiz, only: [:show]
  before_filter :quizzes, only: [:index]
  def check_answer
    puts "=========== controller.check_answer"
    @quiz="@quiz in check_answer"

    @result = Quiz.find_by_quiz_id(params[:quiz_id])
    if @result == nil
      render :text => "couldn't find quiz id: " + params[:quiz_id]
      return
    end
    if @result.answer == params[:user_input] #if answer is same as what user inputed @TODO clean user input.
      render :text => "correct"
    else
      render :text => "wrong as fuckk"
    end
  end

  def quiz
    @quiz = Quiz.find_by_quiz_id(params[:quiz_id])
  end

  def quizzes
    @quizzes = Quiz.all
  end

end
