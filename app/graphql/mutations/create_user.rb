module Mutations
    class CreateUser < BaseMutation
        class AuthProviderSignupData < Types::BaseInputObject
            argument :account, Types::AuthProviderEmailInput, required: false
        end

        argument :auth_provider, AuthProviderSignupData, required: false

        type Types::UserType

        def resolve(auth_provider: nil)
            begin
                User.create!(
                    email: auth_provider&.[](:email)&.[](:email),
                    password: auth_provider&.[](:email)&.[](:password),
                    first_name: auth_provider&.[](:email)&.[](:first_name),
                    last_name: auth_provider&.[](:email)&.[](:last_name),
                    
                )
            rescue ActiveRecord::RecordInvalid => invalid
                GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
            end
        end
    end
end