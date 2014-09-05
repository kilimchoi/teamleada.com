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

end
