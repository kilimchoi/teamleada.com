class Admin::ProjectsController < Admin::BaseController
  load_and_authorize_resource
  include ChartsHelper

  def index
    @projects_chart = multiple_projects_chart(30.days.ago)
  end

  def show
  end

end
