class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  # Defaults
  default from: 'hello@smumods.com',
          bcc: ["Test <gabriel@smumods.com>"]
  default delivery_method_options: { 
    api_key: Rails.application.credentials.mailjet[:api_key], 
    secret_key: Rails.application.credentials.mailjet[:secret_key],
    version: 'v3.1'
  } 

  def send_verification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verify Your SMUMods Account')
  end

  def send_reset_password_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Your SMUMods Account Password')
  end

  def send_wrong_user_email(user)
    @user = user
    mail(to: @user.email, subject: 'SMUMods Forget Password Email')
  end
end
