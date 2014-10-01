class QuizzesController < ApplicationController
  load_and_authorize_resource :quiz
  before_filter :set_slide, only: [:check_answer]

  def check_answer
    if params[:quiz_id] == nil
      render json: { error: "quiz_id is empty" }, status: :unprocessable_entity
      return
    end
    @quiz = Quiz.find_by_quiz_id(params[:quiz_id])
    if @quiz.nil?
      render json: { error: "couldn't find quiz id: #{params[:quiz_id]}" }, status: :unprocessable_entity
      return
    end
    sanitized_user_input = params[:user_input].nil? ? nil : Quiz.sanitize_answer(params[:user_input])
    if (not sanitized_user_input.nil?) && sanitized_user_input != ""
      quiz_submission_content = QuizSubmissionContent.create_with_user_project_slide_quiz_content(current_user, @quiz.project, @slide, @quiz, sanitized_user_input)

      if @quiz.correct_answer?(sanitized_user_input)
        render json: { text: "correct" }, status: :ok
      else
        render json: { text: "incorrect" }, status: :ok
      end
    else
      render json: { text: "nil or empty" }, status: :ok
    end
  end

  private

  def set_slide
    @slide = Slide.find_by(
      parent_type: params[:parent_type],
      parent_id: params[:parent_id],
      slide_id: params[:slide_id],
    )
  end

end
