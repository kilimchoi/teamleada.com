class QuizzesController < ApplicationController
  load_and_authorize_resource :quiz

  def check_answer
    if params[:quiz_id] == nil
      render text: "quiz_id is empty"
      return
    end
    @quiz = Quiz.find_by_quiz_id(params[:quiz_id])
    if @quiz.nil?
      render text: "couldn't find quiz id: #{params[:quiz_id]}"
      return
    end
    sanitized_user_input = params[:user_input].nil? ? nil : Quiz.sanitize_answer(params[:user_input])
    if (not sanitized_user_input.nil?) && sanitized_user_input != ""
      quiz_submission = QuizSubmission.new(user: current_user, quiz: @quiz, submitted_answer: sanitized_user_input)
      quiz_submission.save!

      if @quiz.correct_answer?(sanitized_user_input)
        render text: "correct" #"correct" is used as key, don't change
      else
        render text: "incorrect"
      end
    else
      render text: "nil or empty"
    end
  end

end
