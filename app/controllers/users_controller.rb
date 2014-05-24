class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :auth_code

  respond_to :html, :json

  def show
    @user.resumes.build
  end

  def edit
    @profile_needs_info = signed_in? && current_user.has_missing_profile_info?
  end

  def update
    if @user.update_attributes(user_params)
      if params[:user].has_key? :password
        @user.password_updated!
      end
      sign_in(@user, bypass: true)
      respond_to do |format|
        format.json { render json: {data: {first_name: @user.first_name, last_name: @user.last_name}}, status: :ok }
        format.html {
          flash[:info] = "You have successfully uploaded your resume viewable by: #{@user.who_can_see_resume}."
          redirect_to user_path(@user)
        }
      end
    else
      puts @user.errors.messages
      respond_to do |format|
        format.json { render json: {data: {full_messages: @user.errors.full_messages, errors: @user.errors.messages.to_a}}, status: :unprocessable_entity }
        format.html {
          flash[:error] = "There was a problem uploading your resume."
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
        redirect_to student_path
      else
        unless @code.enabled?
          flash[:error] = "We are sorry. It looks like this code has expired and is no longer valid. Please contact us if you think this is an error."
          redirect_to :back
          return
        end
        current_user.codes << @code
        # TODO: Not hard code project-access
        if @code.access_type == 'project-access'
          flash[:info] = "Congratulations, you now have access to our data projects!"
          redirect_to projects_path
        else
          flash[:info] = "You have successfully used your code: #{@code.value}"
          redirect_to student_path
        end
      end
    else
      flash[:danger] = "Invalid code entered."
      redirect_to student_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation,
                                 :who_can_see_profile, :who_can_send_friend_requests, :who_can_contact,
                                 :who_can_lookup_using_email, :who_can_lookup_by_name,
                                 :resume_file, :who_can_see_resume, resumes_attributes: [
                                   :id,
                                   :resume_file,
                                 ])
  end

end
