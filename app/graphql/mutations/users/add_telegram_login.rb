module Mutations
    module Users
        class AddTelegramLogin < Mutations::BaseMutation
            null true

            argument :telegram_id, Integer, required: true

            field :success, String, null: true

            def resolve(telegram_id:)
                return unless telegram_id
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                user_with_telegram_id = User.find_by(telegram_id: telegram_id)
                if user_with_telegram_id.nil?
                    if current_user.update(telegram_id: telegram_id)
                        current_user.send_welcome_message!
                        return { success: true }
                    else
                        raise GraphQL::ExecutionError.new("We could not add Telegram Login for your account due to some server issues. Please contact us if it persists")
                    end
                else
                    if current_user == user_with_telegram_id
                        raise GraphQL::ExecutionError.new("You have already linked your Telegram Account with your SMUMods Account")
                    elsif user_with_telegram_id
                        raise GraphQL::ExecutionError.new("Your Telegram Account has been linked with another SMUMods Account. If this is a mistake, please contact @smumods immediately")
                    else
                        raise GraphQL::ExecutionError.new("There were some server issues with adding your Telegram Account to your SMUMods Account. Please contact us at @smumods")
                    end
                end
            end
        end
    end
end
