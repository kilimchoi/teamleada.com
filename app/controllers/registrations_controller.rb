class RegistrationsController < Devise::RegistrationsController

  def new
    @sign_up_form = SignUpForm.new
  end

  def create
    @sign_up_form = SignUpForm.new
    if @sign_up_form.submit(params[:sign_up_form])

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
      projects_path
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
      projects_path
    end
  end

end
