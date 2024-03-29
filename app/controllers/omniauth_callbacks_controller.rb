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
        flash[:notice] = after_sign_up_message(@user)
        sign_in @user
        redirect_to after_sign_up_path_for(@user)
      else
        session["devise.linkedin_uid"] = request.env["omniauth.auth"].uid
        sign_in @user
        redirect_to after_sign_up_path_for(@user)
      end
    end
  end

  def failure
    flash[:error] = "There was a problem logging in, please try again."
    redirect_to root_url
  end

  private

  def after_sign_up_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    elsif !user.has_completed_onboarding_project?
      project_lesson_path(Project.onboarding_project, Project.onboarding_project.lessons.first)
    else
      user_path(user)
      # Code below takes them back to previous page
      # session[:previous_url] || root_path
    end
  end

  def after_sign_up_message(user)
    if user.is_admin?
      "Logged in as an admin."
    elsif !user.has_completed_onboarding_project?
      ## Project Clarity - TODO(mark): I want this to show up as a more permanent message rather than just a flash message.
      "Here is your first Leada data challenge. We'll teach you how to submit code and get your submissions viewed by a hiring manager of the top data science companies!"
    else
      "Successfully logged in."
    end
  end

end
