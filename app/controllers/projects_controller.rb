class ProjectsController < ApplicationController
  before_filter :project, only: [:show, :check_submission]
  before_filter :projects, only: [:index]

  def show
  end

  def index
    # Add extra "coming soon" projects
    3.times do
      @projects.push(Project.new(title: "Coming soon!"))
    end
  end

  def check_submission
    if params[:file].nil?
      flash[:error] = "You must provide a submission file."
      redirect_to :back
    end
    score = @project.check_submission(params[:file])
    @submission = Submission.new(project: @project, user: current_user, score: score)
    if @submission.save
      flash[:notice] = "Your score is: #{score}. Check how you did on the LEADAboard!"
      redirect_to project_path(url: @project.url)
    else
      flash[:error] = "There was an error in your submission, please try again."
      redirect_to :back
    end
  end

  private

  def project
    @project = Project.find_by(url: params[:url] || params[:project_url])
  end

  def projects
    @projects = Project.all
  end

end
