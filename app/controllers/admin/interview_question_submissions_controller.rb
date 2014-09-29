class Admin::InterviewQuestionSubmissionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @interview_question_submissions = @interview_question_submissions.paginate(page: params[:page])
  end

  def show
  end

end
