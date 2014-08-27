class ProjectAccessMailerr < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def send_grant_access(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "")
  end

  def send_deny_access(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "")
  end

end
