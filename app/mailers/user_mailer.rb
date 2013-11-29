class UserMailer < ActionMailer::Base
  default from: "jsw823@gmail.com"

  def invitation_to_project_email(invite)
    @invite = invite
    mail(to: invite.email, subject: "Invitation to join Basic Camp")
  end
end
