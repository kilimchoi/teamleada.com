class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    auth = env["omniauth.auth"]
    @user = User::connect_to_linkedin(request.env["omniauth.auth"],current_user)
    if @user.username != nil
      flash[:notice] = "Success!`"
      sign_in_and_redirect @user, :event => :authentication
    else
      #session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
      debugger
      byebug
      redirect_to :linkedin_confirm
      #redirect_to linkedin_confirm
    end
  end
end
