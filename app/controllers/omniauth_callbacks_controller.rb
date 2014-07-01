class OmniauthCallbacksController < Devise::OmniauthCallbacksController
 # linkedin_options = {
 #   scope: 'r_fullprofile r_emailaddress',
 #   fields: ['id', 'email-address', 'first-name', 'last-name', 'headline', 'location', 'industry', 'picture-url', 'public-profile-url', "picture-urls::(original)"]
 # }
#  provider :linkedin, app_id,app_secret, linkedin_options
#  client = LinkedIn::Client.new

  def linkedin
    byebug
    auth = env["omniauth.auth"]
    @user = User.connect_to_linkedin(request.env["omniauth.auth"], current_user)
    if @user.username != nil
      flash[:notice] = "Logged in via LinkedIn!"
      sign_in_and_redirect @user, :event => :authentication
    else
      byebug
      session["devise.linkedin_uid"] = request.env["omniauth.auth"].uid
      redirect_to show_linkedin_confirm_path
    end
  end
end
