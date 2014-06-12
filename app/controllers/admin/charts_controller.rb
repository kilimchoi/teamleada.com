class Admin::ChartsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def show_by_category
    @charts = Chart.where(category: params[:category])
  end

end
