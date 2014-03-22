class ProjectsController < ApplicationController
  before_filter :project, only: [:show]
  before_filter :projects, only: [:index]

  def show
  end

  def index
    # Add extra "coming soon" projects
    3.times do
      @projects.push(Project.new(title: "Coming soon!"))
    end
  end

  private

  def project
    @project = Project.find_by(url: params[:url])
  end

  def projects
    @projects = Project.all
  end

end
