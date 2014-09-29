class InterviewQuestionsController < ApplicationController
  load_and_authorize_resource :interview_question
  before_filter :load_interview_questions

  def index
  end

  def show
    @interview_question_submission_form = InterviewQuestionSubmissionForm.new(current_user, @interview_question)
  end

  def submit
    @interview_question_submission_form = InterviewQuestionSubmissionForm.new(current_user, @interview_question)
    if @interview_question_submission_form.submit(params[:interview_question_submission_form])
      flash[:info] = "Your answer has been submitted"
    else
      flash[:danger] = "There was a problem submitting your answer"
    end
    redirect_to @interview_question
  end

  private

  def load_interview_questions
    @interview_questions = InterviewQuestion.all
  end

end
