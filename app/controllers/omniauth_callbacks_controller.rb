class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    byebug
    if (not current_user.nil?) &&current_user.confirmed?
      #integrate account
      @user = User.update_with_linkedin(env["omniauth.auth"], current_user)
      flash[:notice] = "Integrated with LinkedIn Prof!"
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
