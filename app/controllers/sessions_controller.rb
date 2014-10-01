class SessionsController < Devise::SessionsController
  before_filter :configure_permitted_parameters, only: [:create]

  def new
    session[:return_to] ||= request.referer

    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  def create
    session[:return_to] ||= request.referer

    self.resource = warden.authenticate(auth_options)
    if resource.nil?
      flash[:danger] = "Invalid username or password."
      self.resource = resource_class.new(sign_in_params)
      render :new
      return
    end
    set_flash_message(:info, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    session[:return_to] ||= request.referer

    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :info, :signed_out if signed_out && is_flashing_format?
    yield if block_given?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |user|
      user.permit(:email, :password, :remember_me)
    end
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  private

  def after_sign_in_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    elsif user.is_company?
      #company_dashboard_path
      company_browse_users_path
    elsif user.has_project_access?
      companies_path
    else
      # For now, always redirect_to companies_path
      companies_path
    end
  end

end

