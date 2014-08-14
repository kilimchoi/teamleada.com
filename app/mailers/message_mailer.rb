class MessageMailer < ActionMailer::Base
  default from: "noreply@teamleada.com"

  def message_email(message, sender, receiver)
    @receiver = receiver
    @sender = sender
    mail(to: @receiver.email, subject: "[Leada] #{@sender.name} sent you a message")
  end

end

