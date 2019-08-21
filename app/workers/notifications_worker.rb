class NotificationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(task, user_id, options)
    # Map to corresponding task
    options ||= {}
    binding.pry
    send(task.to_sym, user_id, options)
  end

  def send_welcome_message(user_id, options)
    user = User.find(user_id)
    Telegram.bot.send_message(chat_id: user.telegram_id, text: "Welcome to SMUMods! You have successfully linked your account with #{user.email}")
  end

  def send_new_review_message(user_id, options)
    user = User.find(user_id)
    Telegram.bot.send_message(chat_id: user.telegram_id, text: "Hello")
  end

  def notify_members_of_event(user_id, options)
    binding.pry
    user = User.find(user_id)
    Telegram.bot.send_photo(chat_id: user.telegram_id, photo: options["image"], caption: options["message"])
  end
end
