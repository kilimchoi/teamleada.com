class ProjectAccessMailer < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def send_grant_access_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "Congratulations! You've been accepted into Leada!")
  end

  def send_deny_access_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "Leada Project Results")
  end

end
