module Mutations
  module TemporaryUsers
    class LoginTemporaryUser < Mutations::BaseMutation
      description 'Logs a temporary user in'

      null true

      argument :client_verifier, String, required: true
      argument :token, String, required: true
      argument :login_token, String, required: true

      field :token, String, null: true

      def resolve(client_verifier:, token:, login_token:)
        return unless client_verifier
          return unless token
          return unless login_token

          temporary_user = TemporaryUser.where(client_verifier: client_verifier, session_token: token, login_token: login_token).first
          if not temporary_user
            raise GraphQL::ExecutionError.new("Invalid Temporary User")
          end
          user = User.where(telegram_id: temporary_user.telegram_id).first
          if not user or user.telegram_id.nil?
            raise GraphQL::ExecutionError.new("Invalid User")
          end
          session = user.sessions.create!
          if not session
            raise GraphQL::ExecutionError.new("Unable to create a session. If this problem persists, contact us!")
          else
            if not temporary_user.destroy
              raise GraphQL::ExecutionError.new("There was an issue deleting the temporary user. Contact us!")
            end
          end
          { token: session.key }
      end
    end
  end
end
