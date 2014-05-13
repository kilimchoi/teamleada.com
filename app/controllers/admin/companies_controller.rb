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
    @projects = Project.all
  end

  def update
  end

  def destroy
  end

  def index
  end

  def add_project
    @project = Project.find(params[:company_project][:project_id])
    @company_project = CompanyProject.find_by(company: @company, project: @project)
    unless @company_project.nil?
      flash[:danger] = "You have already assigned #{@project.title} to the comapny #{@company.name}."
      redirect_to admin_company_path(@company)
    else
      @company_project = CompanyProject.create(company: @company, project: @project)
      flash[:info] = "Success! You have added #{@project.title} to the company #{@company.name}."
      redirect_to admin_company_path(@company)
    end
  end

  def add_user

  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end
