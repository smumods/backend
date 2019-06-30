module Mutations
    module Users
        class ForgetPassword < Mutations::BaseMutation

            # Arguments
            argument :email, String, required: true

            # return type from the mutation
            field :success, String, null: false

            def resolve(email:)
                if email.nil? or email.empty? or User.validate_email_format(email).nil?
                    raise GraphQL::ExecutionError.new("Invalid email")
                    return
                else
                    # Valid email
                    user = User.find_by(email: email)
                    if user
                        # Send an reset password email if user exists
                        UserMailer.send_reset_password_email(user).deliver_now
                    else
                        # Send an email stating that we couldn't find an email with this address
                        UserMailer.send_wrong_user_email(User.new(email: email)).deliver_now
                    end
                    return { success: true }
                end
            end
        end
    end
end