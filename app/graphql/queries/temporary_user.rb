module Queries
    class TemporaryUser < Queries::BaseQuery
        description 'Returns a temporary user given a client_identifier'
        
        type Types::TemporaryUserType, null: false

        argument :client_verifier, String, required: true

        def resolve(client_verifier:)
            ::TemporaryUser.find_by_client_verifier(client_verifier)
        end
    end
end