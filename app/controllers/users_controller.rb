class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :auth_code

  respond_to :html, :json

  def show
  end

  def edit
  end

  def update
    old_password = params[:user].try(:password)
    if @user.update_attributes(user_params)
      if @user.password != old_password
        @user.password_updated!
      end
      sign_in(@user, bypass: true)
      respond_with_bip @user
    else
      respond_with @user, status: :unprocessible_entity
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
        current_user.codes << @code
        # TODO: Not hard code project-access
        if @code.group == 'project-access'
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
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
