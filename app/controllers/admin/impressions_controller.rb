class Admin::ImpressionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @impressions = @impressions.paginate(page: params[:page])
  end

  def daily
  end

  def weekly
  end

  def monthly
  end

  # Project Views
  def daily_projects
  end

end

