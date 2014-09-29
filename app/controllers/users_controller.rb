class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: [:auth_code, :change_role, :submit_project_submission]

  respond_to :html, :json

  def show
  end

  def edit
    @user = current_user
    @profile_needs_info = signed_in? && current_user.has_missing_profile_info?
  end

  def profile
    @user = current_user
    render "show"
  end

  def edit_profile
    @user = current_user
    @is_editing = true

    @edit_about_form = EditAboutForm.new(@user)
    @edit_job_experience_form = EditJobExperienceForm.new(@user)
    @edit_enrollment_form = EditEnrollmentForm.new(@user)
  end

  def update
    # TODO: This is hacky, should make a validation that does this.
    if params[:is_resume_form]
      if params[:user]["resumes_attributes"].nil?
        respond_to do |format|
          format.json { render json: {data: {error: "You must attach your file in order to upload it."}}, status: :unprocessable_entity }
        end
        return
      end
    end
    if @user.update_attributes(user_params)
      if params[:user].has_key? :password
        @user.password_updated!
      end
      if !signed_in?
        sign_in(@user, bypass: true)
      end
      respond_to do |format|
        format.json { render json: {data: {first_name: @user.first_name, last_name: @user.last_name}}, status: :ok }
        format.html {
          flash[:info] = "You have successfully uploaded your file!"
          redirect_to user_path(@user)
        }
      end
    else
      puts @user.errors.messages
      respond_to do |format|
        format.json { render json: {data: {full_messages: @user.errors.full_messages, errors: @user.errors.messages.to_a}}, status: :unprocessable_entity }
        format.html {
          flash[:error] = "There was a problem uploading your resume. Your resume must be a pdf."
          redirect_to user_path(@user)
        }
      end
    end
  end

  def auth_code
    @code = Code.find_by(value: params[:code])
    unless @code.nil?
      existing = current_user.codes.where(value: params[:code]).count > 0
      if existing
        flash[:danger] = "You have already used that code."
        redirect_to learn_path
      else
        unless current_user.add_code(@code)
          flash[:error] = "We are sorry. It looks like this code has expired and is no longer valid. Please contact us if you think this is an error."
          redirect_to :back
          return
        end
        # TODO: Not hard code project-access
        if @code.access_type == 'project-access'
          flash[:info] = "Congratulations, you now have access to our data projects!"
          redirect_to companies_path
        else
          flash[:info] = "You have successfully used your code: #{@code.value}"
          redirect_to learn_path
        end
      end
    else
      flash[:danger] = "Invalid code entered."
      redirect_to learn_path
    end
  end

  def change_role
    redirect_to root_path and return unless Rails.env.development? && signed_in?
    current_user.role = params[:role]
    if current_user.is_company? && current_user.company.nil?
      # Since we're in development mode, we can add people to the test company which is seeded.
      current_user.company = Company.find_by(name: "Leada")
    end
    current_user.save
    flash[:info] = "Successfully changed your role to: #{current_user.role}."
    redirect_to root_path
  end

  def submit_project_submission
    if params[:is_project_submission_form]
      if params[:user]["project_submissions_attributes"].nil?
        respond_to do |format|
          format.json { render json: {data: {error: "You must attach your file in order to upload it."}}, status: :unprocessable_entity }
        end
        return
      end
    end

    @project = Project.find(params[:project_id])
    if current_user.update_attributes(user_params)
      project_submission = current_user.project_submissions.last
      project_submission.project = @project
      project_submission.save
      flash[:info] = "Your file has been submitted!"
    else
      flash[:error] = "There was a problem uploading your submission. Please try again!"
    end

    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation,
                                 :who_can_see_profile, :who_can_send_friend_requests, :who_can_contact,
                                 :who_can_lookup_using_email, :who_can_lookup_by_name,
                                 :looking_for_opportunities, :photo, :bio,
                                 :resume_file, :who_can_see_resume, {
                                   resumes_attributes: [
                                     :id,
                                     :resume_file,
                                   ],
                                   profile_photos_attributes: [
                                     :id,
                                     :photo,
                                   ],
                                 })
  end

end
