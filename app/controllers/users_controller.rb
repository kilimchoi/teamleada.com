class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :user, only: [:show]

  def show
  end

  def auth_code
    @code = Code.find_by(value: params[:code])
    if @code
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

  def user
    @user = User.find(params[:id])
  end

end
