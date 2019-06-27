module Mutations
    module Users
        class VerifyEmail < Mutations::BaseMutation
            null true

            argument :email_token, String, required: true

            field :success, String, null: true
            

            def resolve(email_token:)
                return unless email_token
                user = User.find_by_email_token(email_token)
                if user
                    # Valid email token
                    if user.update(verified: true)
                        return { success: true }
                    else
                        raise GraphQL::ExecutionError.new("There was an issue verifying your user account. Please contact an admin!):")
                        return
                    end
                else
                    raise GraphQL::ExecutionError.new("Invalid token or token has expired")
                end
            end
        end
    end 
end