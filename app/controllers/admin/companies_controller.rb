class Admin::CompaniesController < Admin::BaseController
  load_and_authorize_resource

  def new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:info] = "You have successfully made a company."
      redirect_to admin_company_path(@company)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end
