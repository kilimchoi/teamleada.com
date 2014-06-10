class Admin::QuestionsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def hide
    @question.hidden = true
    @question.save
    flash[:info] = "You have successfully hidden the question: #{@question.title}"
    redirect_to admin_questions_path
  end

end
