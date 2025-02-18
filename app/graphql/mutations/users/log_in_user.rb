module Mutations
    module Users
        class LogInUser < Mutations::BaseMutation
            null true

            argument :email, String, required: true
            argument :password, String, required: true

            field :token, String, null: true
            field :user, Types::UserType, null: true            

            def resolve(email: nil, password: nil)
                return unless email
                begin
                    user = User.find_by_email(email.downcase)
                    if not user or not user.valid_password?(password)
                        raise GraphQL::ExecutionError.new("Invalid credentials")
                    end
                    session = user.sessions.create!
                    { user: user, token: session.key }
                rescue ActiveRecord::RecordInvalid => invalid
                    GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
                end
            end
        end
    end 
end