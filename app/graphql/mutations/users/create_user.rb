module Mutations
    module Users
        class CreateUser < Mutations::BaseMutation

            argument :email, String, required: true
            argument :password, String, required: true
            argument :first_name, String, required: true
            argument :last_name, String, required: true
            argument :telegram_username, String, required: false

            type Types::UserType

            def resolve(email: nil, first_name: nil, last_name: nil, password: nil, telegram_username: nil)
                begin
                    user = User.new(
                        email: email,
                        first_name: first_name,
                        last_name: last_name,
                        password: password,
                        telegram_username: telegram_username.present? ? telegram_username : nil
                    )
                    binding.pry
                    user.save
                    raise GraphQL::ExecutionError.new("#{user.errors.full_messages.join(", ")}") unless user.persisted?
                    user
                rescue ActiveRecord::RecordInvalid => invalid
                    GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(', ')}")
                end
            end
        end
    end
end