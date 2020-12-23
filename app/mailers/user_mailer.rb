class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  # Attributes
  # attr_reader :delivery_method_options

  # Defaults yash: not sure what this code is for - check
  # default from: 'hello@smumods.com' 
  # default delivery_method_options: { 
  #   api_key: Rails.application.credentials.dig(:mailgun, :api_key)
  # }
  
  # default mail_settings: {
  #   bcc: {
  #     enable: true,
  #     email: 'hello@smumods.com'
  #   }
  # }
  
  
  def send_verification_email(user_id)
    # mg_client = Mailgun::Client.new '27c77a9d50ad861c05482e765abbc251-b6190e87-a5532af3' # how do i use api_key var here
    @user = User.find(user_id)  
    # binding.pry
    mail(to: @user.email, subject: 'Verify Your SMUMods Account')
  end

  def send_reset_password_email(user)
    @user = user
    # mail(to: @user.email, subject: 'Reset Your SMUMods Account Password')
  end

  def send_wrong_user_email(user)
    @user = user
    # mail(to: @user.email, subject: 'SMUMods Forget Password Email')
  end

  # def delivery_method_options
  #   return {} unless Rails.env.production?
  #   return { 
  #     api_key: Rails.application.credentials.mailjet[:api_key], 
  #     secret_key: Rails.application.credentials.mailjet[:secret_key],
  #     version: 'v3.1'
  #   }
  # end
end
