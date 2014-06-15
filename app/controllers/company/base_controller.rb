class Company::BaseController < ApplicationController
  before_filter :check_role

  private

  def check_role
    unless signed_in? && current_user.is_company?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

end
