class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :store_location

  def store_location  # store last url - this is needed for post-login redirect to whatever the user last visited.
  	if (request.fullpath != "/login" &&
  		request.fullpath != "/logout" &&
	  		request.fullpath != "/sign_up" &&
	  		!request.xhr? &&
	  		(request.format == "text/html" || request.content_type == "text/html"))
	  	session[:previous_url] = request.fullpath
	  	session[:last_request_time] = Time.now.utc.to_i
		end
	end

	def after_sign_in_path_for(resource)
		request.env['omniauth.origin'] || session[:previous_url] || root_path
	end

	def after_sign_up_path_for(resource)
		request.env['omniauth.origin'] || session[:previous_url] || root_path
	end
end