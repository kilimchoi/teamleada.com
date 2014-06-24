class InvitesController < ApplicationController
  load_and_authorize_resource

  def index
    @invite = current_user.invites.build
  end

  def create
    @user = User.new(user_params)
    @user.role = "student"
    if @user.save
      message = "#{@user.email} has been invited to Leada! Invite #{Invite::INVITES - current_user.invites.count} more friends to receive project access!"
      if Rails.env.development?
        secret = @user.generate_new_token
        message += " DEVELOPMENT MODE: <a href='" + user_confirmation_url(confirmation_token: secret) + "'>Activate</a>"
      end
      flash[:info] = message.html_safe
      redirect_to invites_path
    else
      flash[:danger] = "There was an error sending an email to #{@user.email}."
      redirect_to invites_path
    end
  end

  private

  def user_params
    params.permit(:invited_email)
  end

end
