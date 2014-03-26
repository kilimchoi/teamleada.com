class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  unless Rails.application.config.consider_all_requests_local
  	rescue_from Exception, :with => :render_404
  	rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  	rescue_from ActionController::RoutingError, :with => :render_404
  	rescue_from ActionController::UnknownController, :with => :render_404
  end

  def render_404
  	#render :template => '/pages/404.html.slim', :layout => false, :status => :not_found
  	redirect_to("404") and return
  	if Rails.application.config.consider_all_requests_local
  		redirect_to("pages#404") and return
	  	#render :template => '/pages/404.html.slim', :layout => false, :status => :not_found
	  end
	end
	def render_not_found(exception)
		log_error(exception)
		render :template => "/pages/404.html.slim", :status => 404
	end

end