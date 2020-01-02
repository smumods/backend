module Mutations
    module Users
        class VerifyEmail < Mutations::BaseMutation
            null true

            argument :email_token, String, required: true
            argument :uuid, String, required: true

            field :success, String, null: true

            def resolve(email_token:, uuid:)
                return unless email_token
                
                # Make sure user is logged in
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                return { success: false } if current_user.nil?

                # If user is logged in and already verified, return success
                return { success: true } if current_user.present? and current_user.verified
                
                # Too many tries
                raise GraphQL::ExecutionError.new("You have attempted to verify your account too many times wrongly. Contact @smumods on Telegram for help") if user.verification_count > User.MAX_VERIFICATION_TRIES
                
                # Valid email token
                if current_user.email_token != email_token
                    current_user.update(verification_count: current_user.verification_count + 1)
                    raise GraphQL::ExecutionError.new("Invalid token or it has expired")
                    return { success: false }
                end

                user_updated = current_user.update(verified: true, email_token: nil, verification_count: 0)
                raise GraphQL::ExecutionError.new("There was an issue verifying your user account. Please contact an admin!):") unless user_updated

                return { success: true }
            end
        end
    end 
end