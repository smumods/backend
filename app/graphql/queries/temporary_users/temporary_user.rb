module Queries
    module TemporaryUsers
        class TemporaryUser < Queries::BaseQuery
            description 'Returns a temporary user given a client_identifier'

            type Types::TemporaryUserType, null: false

            argument :client_verifier, String, required: true
            argument :token, String, required: true

            def resolve(client_verifier:, token:)
                temporary_user = ::TemporaryUser.where(client_verifier: client_verifier, session_token: token).first
                if temporary_user.nil?
                  raise GraphQL::ExecutionError.new("Something went wrong!")
                end
                if not temporary_user.telegram_id.nil?
                  user = User.where(telegram_id: telegram_id).first
                  if user
                    if user.old_system
                      # Old System
                      if user.old_system.verified
                        user.generate_login_token!
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "loginUser",
                          login_token: user.login_token
                        )
                      else
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "verifyEmail",
                          login_token: nil
                        )
                      end
                    else
                      # New System
                      if user.email
                        if user.old_system.verified
                          user.generate_login_token!
                          return OpenStruct.new(
                            client_verifier: client_verifier,
                            action: "loginUser",
                            login_token: user.login_token
                          )
                        else
                          return OpenStruct.new(
                            client_verifier: client_verifier,
                            action: "verifyEmail",
                            login_token: nil
                          )
                        end # user old system verified
                      else
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "enterEmail",
                          login_token: nil
                        )
                      end # user has email check
                    end # user old system check
                  else
                    return OpenStruct.new(
                      client_verifier: client_verifier,
                      action: "loginTelegram",
                      login_token: nil
                    )
                  end # user check
                else
                  # No telegram_id yet
                  return OpenStruct.new(
                    client_verifier: client_verifier,
                    action: "loginTelegram",
                    login_token: nil
                  )
                end
                user.generate_login_token!
                return OpenStruct.new(
                  client_verifier: client_verifier,
                  action: "loginUser",
                  login_token: user.login_token
                )
            end
        end
    end
end
