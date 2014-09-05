class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companies = Company.verified
  end

  def show
  end

  def perks
  end

end
