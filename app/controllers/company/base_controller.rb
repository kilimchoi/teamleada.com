class Company::BaseController < ApplicationController
  # TODO don't use before filter, we want to be able to use authorize_resource class: false
  # but for some reason it's not working for static pages inside a controller.
  before_filter :check_role

  private

  def check_role
    unless signed_in? && current_user.is_company?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end

end
