class UserProfilesController < ApplicationController
  before_filter :set_user

  def update_about
    @edit_about_form = EditAboutForm.new(@user, params[:edit_about_form])
    if @edit_about_form.submit(params[:edit_about_form])
      respond_to { |format| format.js }
    else
      respond_to { |format| format.js }
    end
  end

  def update_job_experience
    @edit_job_experience_form = EditJobExperienceForm.new(@user, params[:edit_job_experience_form])
    if @edit_job_experience_form.submit(params[:edit_job_experience_form])
      respond_to { |format| format.js }
    else
      respond_to { |format| format.js }
    end
  end

  private

  def set_user
    @user = current_user
  end

end

