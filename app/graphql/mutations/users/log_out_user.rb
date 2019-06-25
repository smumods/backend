module Mutations
    module Users
        class LogOutUser < Mutations::BaseMutation
            null true

            argument :token, String, required: true

            field :is_logged_out, String, null: true

            def resolve(token: nil)
                return unless token
                
                user = Session.find_by(key: token).user
                return if user.nil?

                if user.sessions.delete_all
                    { is_logged_out: true }
                else
                    return { is_logged_out: false }
                end
            end
        end
    end
end