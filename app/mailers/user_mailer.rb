class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: 'hello@smumods.com'

  def send_verification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verify Your SMUMods Account')
  end
end
