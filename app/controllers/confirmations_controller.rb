class ConfirmationsController < Devise::ConfirmationsController

  def show_linkedin_confirm
    if signed_in?
      flash[:warning] = "You're already logged in!"
      redirect_to projects_path # halts request cycle
    elsif session["devise.linkedin_uid"].nil? #omniauth.nil?
      flash[:danger] = "You need to authenticate via LinkedIn first!"
      redirect_to root_path
    else
      @user = User.find_by(linkedin_id: session["devise.linkedin_uid"])
    end
  end

  def linkedin_confirm
    @user = User.find_by(linkedin_id: session["devise.linkedin_uid"])

    @user.assign_attributes(permitted_params)

    if @user.valid? && @user.password_match?
      @user.confirm!
      if @user.role.nil?
        @user.role = "student"
        @user.save
      end
      if @user.invited?
        invite = @user.invite
        invite.accepted_at = Time.now
        invite.save
      end
      flash[:info] = "Your account has been confirmed. Check out some of our data projects!"
      sign_in User, @user
      respond_with @user, location: after_confirmation_path_for(@user)
    else
      render action: :'show_linkedin_confirm'
    end
  end

  def confirm
    @original_token = params[resource_name].try(:[], :confirmation_token)
    self.resource = resource_class.find_by_confirmation_token! @original_token

    if resource.valid?
      self.resource.confirm!
      if resource.invited?
        invite = resource.invite
        invite.accepted_at = Time.now
        invite.save
      end
      flash[:info] = "Your account has been confirmed. Fill out your profile and check out our data challenges!"
      sign_in resource_name, resource
      redirect_to edit_user_profile_path
    else
      flash[:danger] = "This confirmation token has expired, please try again or contact us if you are having trouble creating an account."
      redirect_to root_path
    end
  end

  private

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
