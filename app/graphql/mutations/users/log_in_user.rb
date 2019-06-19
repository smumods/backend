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
                    user = User.find_by_email(email)
                    return unless user
                    return unless user.valid_password?(password) 
                    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
                    token = crypt.encrypt_and_sign("user-id:#{ user.id }")
                    { user: user, token: token }
                rescue ActiveRecord::RecordInvalid => invalid
                    GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
                end
            end
        end
    end
end