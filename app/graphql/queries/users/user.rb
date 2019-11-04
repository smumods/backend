module Queries
    module Users
        class User < Queries::BaseQuery
            description 'Return an individual user'
            
            argument :id, String, required: true

            type Types::UserType, null: false

            def resolve(id:)
                ::User.find_by(uuid: id)
            end
        end
    end
end