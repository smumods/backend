module Mutations
    module Users
        class AddTelegram < Mutations::BaseMutation
            argument :telegram_id, Integer, required: false
            argument :telegram_username, String, required: false # might not be set by user
            argument :telegram_picture, String, required: false # might not be set by user

            type Types::UserType

            def resolve(**args)
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("You must be logged in!")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                return if current_user.nil?
                # raise GraphQL::ExecutionError.new("You need to specify the telegram ID!") if args[:telegram_id].nil?
                current_user.update({
                    telegram_id: args[:telegram_id],
                    telegram_username: args[:telegram_username],
                    telegram_picture: args[:telegram_picture]
                })
                current_user
            end
        end
    end
end