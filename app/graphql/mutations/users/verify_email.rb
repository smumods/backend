module Mutations
    module Users
        class VerifyEmail < Mutations::BaseMutation
            null true

            argument :email_token, String, required: true
            argument :uuid, String, required: false

            field :success, String, null: true

            def resolve(**args)
                email_token = args[:email_token]
                return unless email_token
                
                # Make sure user is logged in
                current_user = context[:current_user]
                if current_user.blank? or current_user.nil?
                    raise GraphQL::ExecutionError.new("Authentication required")
                end

                # If user is logged in and already verified, return success
                return { success: true } if current_user.present? and current_user.verified
                
                # Too many tries
                raise GraphQL::ExecutionError.new("You have attempted to verify your account too many times wrongly. Contact @smumods on Telegram for help") if current_user.verification_count > User.MAX_VERIFICATION_TRIES
                
                # Valid email token
                if current_user.email_token != email_token
                    current_user.update_attributes(verification_count: current_user.verification_count + 1)
                    raise GraphQL::ExecutionError.new("Invalid token or it has expired")
                    return { success: false }
                end

                user_updated = current_user.update_attributes(verified: true, email_token: nil, verification_count: 0)
                raise GraphQL::ExecutionError.new("There was an issue verifying your user account. Please contact an admin!):") unless user_updated

                return { success: true }
            end
        end
    end 
end