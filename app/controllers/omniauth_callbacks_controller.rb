class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def linkedin
    if env["omniauth.auth"].nil?
      flash[:error] = "You must be authorized via linkedin to view this page."
      redirect_to root_path
    else
      @user = User.connect_to_linkedin(request.env["omniauth.auth"], current_user)
      puts "CALLBACK @user:email " + @user.email
      puts "CALLBACK @user:linkedin_id " + @user.linkedin_id
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
