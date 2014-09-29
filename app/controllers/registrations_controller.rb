class RegistrationsController < Devise::RegistrationsController

  def new
    @sign_up_form = SignUpForm.new
  end

  def create
    @sign_up_form = SignUpForm.new
    if @sign_up_form.submit(params[:sign_up_form])

      # TODO(mark): Move this message creation to some other sort of object...
      message = "A message with a confirmation link has been sent to your email address. Please click on the link to activate your account."
      if Rails.env.development?
        secret = @sign_up_form.user.generate_new_token
        message += " DEVELOPMENT MODE: <a href='" + confirm_url(confirmation_token: secret) + "'>Activate</a>"
      end
      flash[:info] = message.html_safe

      redirect_to after_sign_up_path_for(@sign_up_form.user)
    else
      render "new"
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

  def after_inactive_sign_up_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    elsif user.is_company?
      company_path(user.company)
    else
      companies_path
    end
  end

end
