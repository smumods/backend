class TelegramController < Telegram::Bot::UpdatesController
  include Rails.application.routes.url_helpers
  # use callbacks like in any other controllers
  # around_action :with_locale

  # Every update can have one of: message, inline_query, chosen_inline_result,
  # callback_query, etc.
  # Define method with same name to respond to this updates.
  def message(message)
    # message can be also accessed via instance method
    message == self.payload # true
    # store_message(message['text'])

    # Handle individual bot messages differently
    chat_type = message['chat']['type']
    from_id = message["from"]["id"]
  end

  def start!(data = nil, *)
    if data.nil?
      respond_with :message, text: "Welcome to SMUModsBot"
    else
      binding.pry
      message = self.payload
      from_id = message["from"]["id"]
      permitted_actions = ["login", "register"]
      data_parts = data.split("__")

      respond_with :message, text: "Invalid action" if data_parts.empty? or not permitted_actions.include? data_parts[0]
      case data_parts[0]
      when "login"
        if data_parts.length != 3
          respond_with :message, text: "Invalid action"
          return
        end
        client_verifier = data_parts[1]
        login_token = data_parts[2]
        temporary_user = TemporaryUser.where(client_verifier: client_verifier, session_token: login_token).first
        if temporary_user
          temporary_user.update(telegram_id: from_id)
          respond_with :message, text: "Logging you in"
        else
          respond_with :message, text: "Invalid login"
        end
        return
      when "register"
      else
      end
    end
  end

  private

  def with_locale(&block)
    I18n.with_locale(locale_for_update, &block)
  end

  def locale_for_update
    if from
      # locale for user
    elsif chat
      # locale for chat
    end
  end
end
