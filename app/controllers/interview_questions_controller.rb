class InterviewQuestionsController < ApplicationController
  load_and_authorize_resource :interview_question
  before_filter :load_interview_questions

  def index
  end

  def show
  end

  private

  def load_interview_questions
    @interview_questions = InterviewQuestion.all
  end

end
