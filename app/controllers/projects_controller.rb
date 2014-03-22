class ProjectsController < ApplicationController
  before_filter :project, only: [:show]
  before_filter :projects, only: [:index]

  def show
  end

  def index
  end

  private

  def project
    @project = Project.find_by(url: params[:url])
  end

  def projects
    @projects = Project.all
    5.times do
      @projects.push(Project.new(title: "Coming soon!", url: "coming-soon"))
    end
  end

end
