class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    if signed_in? && current_user.has_linkedin_integration?
      flash[:warning] = "You've already integrated your linkedin account!"
      redirect_to user_path(current_user)
    elsif !current_user.nil? && current_user.confirmed?
      @user = User.update_with_linkedin(env["omniauth.auth"], current_user)
      flash[:notice] = "We've linked your LinkedIn account and grabbed the relevant profile information."
      redirect_to user_path(current_user)
    elsif env["omniauth.auth"].nil?
      flash[:error] = "You must be authorized via linkedin to view this page."
      redirect_to root_path
    else
      @user = User.connect_to_linkedin(env["omniauth.auth"], current_user)
      if @user.username != nil && @user.confirmed?
        flash[:notice] = "Logged in via LinkedIn!"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.linkedin_uid"] = request.env["omniauth.auth"].uid
        redirect_to show_linkedin_confirm_path
      end
    end
  end
end
