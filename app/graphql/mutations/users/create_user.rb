module Mutations
    module Users
        class CreateUser < Mutations::BaseMutation

            argument :email, String, required: true
            argument :password, String, required: true
            argument :first_name, String, required: true
            argument :last_name, String, required: true

            type Types::UserType

            def resolve(email: nil, first_name: nil, last_name: nil, password: nil)
                begin
                    User.create!(
                        email: email,
                        first_name: first_name,
                        last_name: last_name,
                        password: password
                    )
                rescue ActiveRecord::RecordInvalid => invalid
                    GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
                end
            end
        end
    end
end