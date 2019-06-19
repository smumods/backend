module Mutations
    module Users
        class LogOutUser < Mutations::BaseMutation
            null true

            argument :token, String, required: true

            field :is_logged_out, String, null: true

            def resolve(token: nil)
                return unless token
                if context[:session][:token] == token
                    context[:session][:token] = nil
                    return { is_logged_out: true }
                end
                return { is_logged_out: false }
            end
        end
    end
end