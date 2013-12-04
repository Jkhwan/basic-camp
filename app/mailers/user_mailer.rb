class UserMailer < ActionMailer::Base
  default from: "jwan823@gmail.com"

  def invitation_to_project_email(invite)
    @invite = invite
    mail(to: invite.email, subject: "You're invited to join #{invite.project.name} at Basic Camp", content_type: "text/plain")
  end
end
