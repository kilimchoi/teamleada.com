class InterviewQuestionsController < ApplicationController
  load_and_authorize_resource :interview_question
  before_filter :load_interview_questions, only: [:index, :show]

  layout Proc.new { ["index"].include?(action_name) ? "application" : "interview_questions" }

  def index
  end

  def show
    @interview_question_submission_form = InterviewQuestionSubmissionForm.new(current_user, @interview_question)
  end

  def submit
    @interview_question_submission_form = InterviewQuestionSubmissionForm.new(current_user, @interview_question)
    if @interview_question_submission_form.submit(params[:interview_question_submission_form])
      flash[:info] = "Your answer has been submitted"
      redirect_to InterviewQuestion.next_question_for_user(current_user)
    else
      flash[:danger] = "There was a problem submitting your answer. You must supply an answer!"
      redirect_to @interview_question
    end
  end

  private

  def load_interview_questions
    @interview_questions = InterviewQuestion.displayable_for_user(current_user)
  end

end
