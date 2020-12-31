class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  
  def send_verification_email(user_id)
    @user = User.find(user_id)  
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
