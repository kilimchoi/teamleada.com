class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  impressionist if: :valid_impression?

  after_filter :store_location

  def valid_impression?
    if (controller_name == "projects" && action_name == "submit_resource") ||
       (controller_name == "conversations" && action_name == "autocomplete_user_name")
      false
    else
      true
    end
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/login" &&
        request.fullpath != "/sign-up" &&
        request.fullpath != "/logout" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = "We're sorry, we couldn't find that page!"
    redirect_to root_path
  end

  def after_sign_in_path_for(resource) #added for omniauth signin redirect
    #This will always go to projecs_path ater signing in.
    companies_path || request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
