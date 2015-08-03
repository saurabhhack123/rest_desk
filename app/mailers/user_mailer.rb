class UserMailer < ApplicationMailer
  def send_verification_email(user)
    verification_link = link_to 'verification link', user_confirm_path(user, token: user.verification_token)
    mail to: user.email,
         from: 'no-reply@example.com',
         subject: 'please verify your account',
         body: "Click the link #{verification_link.html_safe}"
  end
end
