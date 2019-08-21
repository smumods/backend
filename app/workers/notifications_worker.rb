class NotificationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(task, user_id)
    # Map to corresponding task
    send(task.to_sym, user_id)
  end

  def send_welcome_message(user_id)
    user = User.find(user_id)
    Telegram.bot.send_message(chat_id: user.telegram_id, text: "Welcome to SMUMods! You have successfully linked your account with #{user.email}")
  end

  def send_new_review_message(user_id)
    user = User.find(user_id)
    Telegram.bot.send_message(chat_id: user.telegram_id, text: "Hello")
  end
end
