class InviteMailer < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def invite_email(invite)
    @invited_user = invite.invited_user
    @access_code = Code.find_by(user_type: "invited-users")
    mail(to: @invited_user.email, subject: "You have been invited for beta acccess to Leada!")
  end

end
