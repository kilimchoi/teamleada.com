class InvitesController < ApplicationController
  load_and_authorize_resource

  def index
    @invite = current_user.invites.build
  end

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
      @invite.send_user_invite!
      message = "#{@invite.invited_email} has been invited to Leada! Invite #{Invite::INVITES - current_user.invites.count} more friends to receive project access!"
      if Rails.env.development?
        secret = @user.generate_new_token
        message += " DEVELOPMENT MODE: <a href='" + user_confirmation_url(confirmation_token: secret) + "'>Activate</a>"
      end
      flash[:info] = message.html_safe
      redirect_to invites_path
    else
      flash[:danger] = "There was an error sending an email to #{@invite.invited_email}."
      redirect_to invites_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:invited_email)
  end

end
