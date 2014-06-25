class EvaluationMailer < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def send_feedback(user, project, evaluations)
    @user = user
    @project = project
    @evaluations = evaluations
    mail(to: @user.email, subject: "Your submissions for #{@project.title} have been graded!")
  end

end
