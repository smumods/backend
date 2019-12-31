module Mutations
    module Users
        class VerifyEmail < Mutations::BaseMutation
            null true

            argument :email_token, String, required: true
            argument :uuid, String, required: true

            field :success, String, null: true

            def resolve(email_token:, uuid:)
                return unless email_token
                
                # If user is logged in and already verified, return success
                current_user = context[:current_user]
                return { success: true } if current_user.present? and current_user.verified
                
                user = ::User.find_by(uuid: uuid)
                raise GraphQL::ExecutionError.new("Invalid User ID") unless user.present?
                return { success: true } if user.verified
                raise GraphQL::ExecutionError.new("You have attempted to verify your account too many times wrongly. Contact @smumods on Telegram for help") if user.verification_count > User.MAX_VERIFICATION_TRIES
                
                # Valid email token
                if user.email_token != email_token
                    user.update(verification_count: user.verification_count + 1)
                    raise GraphQL::ExecutionError.new("Invalid token or it has expired")
                end

                user_updated = user.update(verified: true, email_token: nil, verification_count: 0)
                raise GraphQL::ExecutionError.new("There was an issue verifying your user account. Please contact an admin!):") unless user_updated

                return { success: true }
            end
        end
    end 
end