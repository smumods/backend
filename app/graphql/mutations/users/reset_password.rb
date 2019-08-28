module Mutations
    module Users
        class ResetPassword < Mutations::BaseMutation
            null true

            # Arguments
            argument :id, String, required: true
            argument :token, String, required: true
            argument :password, String, required: true

            # return type from the mutation
            field :success, String, null: false

            def resolve(id: , token: , password: )
                if id.nil? or token.nil?
                    raise GraphQL::ExecutionError.new("Invalid token and id!")
                    return
                end
                # Regardless of whether token is correct or password is provided
                # increment this so we know that someone is trying to brute force
                # the token for this id
                user = User.find_by(id: id)
                user.send(:increment_password_token_tries_count) if user

                # Else continue with checking if the id (uuid) and token are correct. Reset the password then
                if password.nil?
                    raise GraphQL::ExecutionError.new("You need to enter your password!")
                    return
                else
                    # Valid email
                    if User.validate_reset_token_and_update_password(id, token, password)
                        return { success: true }
                    else
                        return { success: false }
                    end
                end

            end
        end
    end
end
