class EmployerApplicationsController < ApplicationController

  def new
    @employer_application = EmployerApplication.new
  end

  def create
    @employer_application = EmployerApplication.new(employer_application_params)
    if @employer_application.save
      flash[:info] = "Thanks for expressing interest. We'll be reaching out if we like your project proposal."
      redirect_to new_employer_path
    else
      render 'new'
    end
  end

  private

  def employer_application_params
    params.require(:employer_application).permit(:name, :email, :industry, :custom_industry, :size, :description)
  end

end
