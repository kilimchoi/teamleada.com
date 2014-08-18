class Admin::ImpressionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @impressions = @impressions.paginate(page: params[:page])
  end

end
