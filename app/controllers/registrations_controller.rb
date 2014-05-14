class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:create]

  def create
    build_resource(sign_up_params)
    session[:return_to] ||= request.referer

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :success, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        message = "A message with a confirmation link has been sent to your email address. Please click on the link to activate your account."
        if Rails.env.development?
          secret = resource.generate_new_token
          message += " DEVELOPMENT MODE: <a href='" + user_confirmation_url(confirmation_token: secret) + "'>Activate</a>"
        end
        flash[:info] = message.html_safe
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:username, :email, :password, :password_confirmation)
    end
  end

  def after_sign_up_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    else
      projects_path
      # Code below takes them back to previous page
      # session[:previous_url] || root_path
    end
  end

  def after_inactive_sign_up_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    elsif user.is_company?
      company_path(user.company)
    else
      projects_path
    end
  end

end
