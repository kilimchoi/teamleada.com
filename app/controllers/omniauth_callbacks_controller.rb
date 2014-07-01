class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    #byebug
    if env["omniauth.auth"].nil?
      flash[:error] = "You must be authorized via linkedin to view this page."
      redirect_to new_login_url
    end
    @user = User.connect_to_linkedin(request.env["omniauth.auth"], current_user)
    if @user.username != nil
      flash[:notice] = "Logged in via LinkedIn!"
      sign_in_and_redirect @user, :event => :authentication
    else
      #byebug
      session["devise.linkedin_uid"] = request.env["omniauth.auth"].uid
      redirect_to show_linkedin_confirm_path
    end
  end

end
