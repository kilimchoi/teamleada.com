class ProjectsController < ApplicationController
  before_filter :project, only: [:show]

  def show
  end

  private

  def project
    @project = Project.find_by(url: params[:url])
  end

end
