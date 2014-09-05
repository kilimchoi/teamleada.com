class CompaniesController < ApplicationController
  load_and_authorize_resource
  layout Proc.new { ["index"].include?(action_name) ? "application" : "companies" }

  def index
    @companies = Company.verified
  end

  def show
  end

  def perks
  end

  def data_challenges_interest
    @company_data_challenge_interest = CompanyDataChallengeInterest.where(user: current_user, company: @company).first_or_initialize
    if @company_data_challenge_interest.new_record? && @company_data_challenge_interest.save
      flash[:info] = "#{@company.name} has been notified of your interest in having them host a data challenge!"
    else
      flash[:warning] = "You have already notified #{@company.name} of your interest in having them host a data challenge!"
    end
    redirect_to company_path(@company)
  end

end
