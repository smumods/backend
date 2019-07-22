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
                if temporary_user.telegram_id
                  user = User.where(telegram_id: telegram_id).first
                  if user
                    if user.old_system
                      # Old System
                      if user.old_system.verified
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "loginUser",
                          loginToken: "ilyvera"
                        )
                      else
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "verifyEmail"
                        )
                      end
                    else
                      # New System
                      if user.email
                        if user.old_system.verified
                          return OpenStruct.new(
                            client_verifier: client_verifier,
                            action: "loginUser",
                            token: ""
                          )
                        else
                          return OpenStruct.new(
                            client_verifier: client_verifier,
                            action: "verifyEmail"
                          )
                        end # user old system verified
                      else
                        return OpenStruct.new(
                          client_verifier: client_verifier,
                          action: "enterEmail"
                        )
                      end # user has email check
                    end # user old system check
                  else
                    return OpenStruct.new(
                      client_verifier: client_verifier,
                      action: "enterEmail"
                    )
                  end # user check
                end
                return OpenStruct.new(
                  client_verifier: client_verifier,
                  action: "loginUser",
                  login_token: "ilyvera"
                )
            end
        end
    end
end
