module Mutations
    class LogInUser < BaseMutation

        argument :email, String, required: true
        argument :password, String, required: true

        type Types::UserType

        def resolve(email: nil, password: nil)
            return unless email
            begin
                user = User.find_by_email(email)
                return unless user.valid_password?(password) 
                user
            rescue ActiveRecord::RecordInvalid => invalid
                GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
            end
        end
    end
end