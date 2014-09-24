class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    if signed_in? && current_user.has_linkedin_integration?
      flash[:warning] = "You've already integrated your linkedin account!"
      redirect_to user_path(current_user)
    elsif !current_user.nil? && current_user.confirmed?
      @user = User.update_with_linkedin(env["omniauth.auth"], current_user)
      flash[:notice] = "Your LinkedIn profile has been integrated with your Leada profile."
      redirect_to user_path(current_user)
    elsif env["omniauth.auth"].nil?
      flash[:error] = "You must be authorized via LinkedIn to view this page."
      redirect_to root_path
    else
      @user = User.connect_to_linkedin(env["omniauth.auth"], current_user)
      if @user.username != nil && @user.confirmed?
        flash[:notice] = "Logged in via LinkedIn!"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.linkedin_uid"] = request.env["omniauth.auth"].uid
        sign_in @user
        redirect_to after_sign_up_path_for(@user)
      end
    end
  end

  private

  def after_sign_up_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    else
      companies_path
      # Code below takes them back to previous page
      # session[:previous_url] || root_path
    end
  end

end
