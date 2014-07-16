class QuizzesController < ApplicationController
  before_filter :quiz, only: [:show]
  before_filter :quizzes, only: [:index]

  def check_answer
    puts "=========== controller.check_answer"
    if params[:quiz_id] == nil
      render :text => "quiz_id is empty"
      return
    end
    @result = Quiz.find_by_quiz_id(params[:quiz_id])
    if @result == nil
      render :text => "couldn't find quiz id: " + params[:quiz_id]
      return
    end
    sanitized_user_input = params[:user_input].nil? ? nil : Quiz.sanitize_answer(params[:user_input])
    if (not sanitized_user_input.nil?) && sanitized_user_input != ""
      quiz_submission = QuizSubmission.new(user: current_user, quiz: @result, submitted_answer: params[:user_input])
      quiz_submission.save!

      if @result.answer.to_s.downcase == params[:user_input].to_s.downcase #if answer is same as what user inputed @TODO clean user input.
        render :text => "correct" #"correct" is used as key, don't change
      else
        render :text => "incorrect"
      end
    else
      render :text => "nil or empty"
    end
  end

  def quiz
    @quiz = Quiz.find_by_quiz_id(params[:quiz_id])
  end

  def quizzes
    @quizzes = Quiz.all
  end

end
