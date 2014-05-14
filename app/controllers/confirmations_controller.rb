class ConfirmationsController < Devise::ConfirmationsController

  def show
    if params[:confirmation_token].present?
      @original_token = params[:confirmation_token]
    elsif params[resource_name].try(:[], :confirmation_token).present?
      @original_token = params[resource_name][:confirmation_token]
    end

    digested_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
    self.resource = resource_class.find_by_confirmation_token digested_token

    if !resource.nil? && resource.confirmed?
      sign_in_and_redirect resource_name, resource
      return
    elsif resource.nil?
      flash[:danger] = "The confirmation token you have entered has expired."
      redirect_to root_path
    end
  end

  def confirm
    @original_token = params[resource_name].try(:[], :confirmation_token)
    self.resource = resource_class.find_by_confirmation_token! @original_token
    resource.assign_attributes(permitted_params)

    if resource.valid? && resource.password_match?
      self.resource.confirm!
      flash[:info] = "Your account has been confirmed. Check out some of our data projects!"
      sign_in resource_name, resource
      respond_with resource, location: after_confirmation_path_for(resource)
    else
      render :action => 'show'
    end
  end

  private

  def permitted_params
    params.require(resource_name).permit(:confirmation_token, :username, :first_name, :last_name, :password, :password_confirmation)
  end

  def after_confirmation_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    else
      projects_path
      # Code below takes them back to previous page
      # session[:previous_url] || root_path
    end
  end

end
