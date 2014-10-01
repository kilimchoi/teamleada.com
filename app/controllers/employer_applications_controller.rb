class EmployerApplicationsController < ApplicationController
  include ApplicationHelper

  def new
    @employer_application = EmployerApplication.new
    @company_logos = get_yaml_data_file("company_logos.yml")
    @employer_data = get_yaml_data_file("employer.yml")
  end

  def create
    @employer_application = EmployerApplication.new(employer_application_params)
    if @employer_application.save
      flash[:info] = "Thanks for expressing interest. We'll be reaching out back to you soon!"
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
