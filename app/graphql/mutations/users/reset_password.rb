module Mutations
    module Users
        class ResetPassword < Mutations::BaseMutation
            null true

            # Arguments
            argument :uuid, String, required: true
            argument :token, String, required: true
            argument :password, String, required: true

            # return type from the mutation
            field :success, String, null: false

            def resolve(uuid: , token: , password: )
                if uuid.nil? or token.nil?
                    raise GraphQL::ExecutionError.new("Invalid token and uuid!")
                    return
                end
                # Regardless of whether token is correct or password is provided
                # increment this so we know that someone is trying to brute force
                # the token for this uuid
                user = User.find_by(uuid: uuid)
                user.send(:increment_password_token_tries_count) if user

                # Else continue with checking if the uuid and token are correct. Reset the password then
                if password.nil?
                    raise GraphQL::ExecutionError.new("You need to enter your password!")
                    return
                else
                    # Valid email
                    if User.validate_reset_token_and_update_password(uuid, token, password)
                        return { success: true }
                    else
                        return { success: false }
                    end
                end
                
            end
        end
    end
end