class InterestedUsersController < ApplicationController

  def create
    @interested_user = InterestedUser.new(interested_user_params)
    if @interested_user.save
      flash[:info] = "Thanks for expressing your interest. We'll contact you when new data projects are released!"
      redirect_to projects_path
    else
      flash[:danger] = "You must enter in a valid email address to get the info about new projects!"
      redirect_to projects_path
    end
  end

  private

  def interested_user_params
    params.require(:interested_user).permit(:email)
  end

end
