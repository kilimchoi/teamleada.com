class UserProfilesController < ApplicationController
  before_filter :set_user
  before_filter :set_forms
  before_filter :configure_forms

  def cancel_update
    respond_to { |format| format.js { render partial: "users/update_profile" } }
  end

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

  def remove_job_experience
    @job_experience = JobExperience.find(params[:id])
    if @job_experience.delete
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    else
      respond_to { |format| format.js { render partial: "users/update_profile" } }
    end
  end

  def update_enrollment
    if @edit_enrollment_form.submit(params[:edit_enrollment_form])
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
    @edit_job_experience_form = EditJobExperienceForm.new(@user)
    @edit_enrollment_form = EditEnrollmentForm.new(@user)
  end

  def configure_forms
    @edit_job_experience_form.configure_with_params(params[:edit_job_experience_form])
    @edit_enrollment_form.configure_with_params(params[:edit_enrollment_form])
  end

end

