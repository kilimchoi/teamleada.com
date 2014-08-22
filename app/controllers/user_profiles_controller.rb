class UserProfilesController < ApplicationController
  before_filter :set_user
  before_filter :set_forms

  def update_about
    if @edit_about_form.submit(params[:edit_about_form])
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    else
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    end
  end

  def update_job_experience
    if @edit_job_experience_form.submit(params[:edit_job_experience_form])
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    else
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_forms
    @edit_about_form = EditAboutForm.new(@user)
    @edit_job_experience_form = EditJobExperienceForm.new(@user, params[:edit_job_experience_form])
  end

end

