class InvitesController < ApplicationController
  load_and_authorize_resource

  def index
    @large_header = true
    @invite = current_user.invites.build
    @invites = current_user.invites.select{ |invite| !invite.new_record? }
  end

  def create
    @invite = Invite.new(invite_params)
    user = User.find_by(email: @invite.invited_email)
    if current_user.has_invites_remaining? && user.nil? && @invite.save
      @invite.send_user_invite!(current_user)
      unless current_user.has_invites_remaining?
        unless current_user.has_project_access?
          current_user.add_code Code.find_by(user_type: "viral-test-1")
        end
      end
      unless current_user.has_invites_remaining?
        message = "#{@invite.invited_email} has been invited to Leada! Congratulations, you now have access to our data projects! <a href='/projects'>Check them out here!</a>"
      else
        message = "#{@invite.invited_email} has been invited to Leada! Invite #{current_user.invites_remaining} more friends to receive project access!"
      end
      if Rails.env.development?
        secret = @invite.invited_user.generate_new_token
        message += " DEVELOPMENT MODE: <a href='" + user_confirmation_url(confirmation_token: secret) + "'>Activate</a>"
      end
      flash[:info] = message.html_safe
      redirect_to invites_path
    else
      puts @invite.errors.messages
      if !user.nil?
        flash[:error] = "#{user.email} already has an account on Leada."
      elsif !current_user.has_invites_remaining?
        flash[:error] = "You have used up all of your invite codes."
      else
        flash[:error] = "There was an error sending an email to #{@invite.invited_email}."
      end
      redirect_to invites_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:invited_email)
  end

end
