class InviteMailer < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def invite_email(invite, token)
    @invited_user = invite.invited_user
    @token = @invited_user.generate_new_token
    mail(to: @invited_user.email, subject: "You have been invited for beta acccess to Leada!")
  end

end
