class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :store_location
#  after_filter :log_request

  # Logging methods
  def log_request
    PageView.create(
      user: current_user,
      url: request.fullpath,
      controller: params[:controller],
      action: params[:action],
      parameters: params,
      properties: {},
      viewed_user_id: viewed_user_id(params)
    )
  end

  def log_event(properties)
  end

  def viewed_user_id(params)
    if params[:controller] == "users" && params[:action] == "show"
      params[:id]
    else
      nil
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
    flash[:danger] = exception.message
    redirect_to root_path
  end

end
