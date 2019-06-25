module Queries
    module Users
        class User < Queries::BaseQuery
            description 'Return an individual user'
            
            argument :id, Int, required: true

            type Types::UserType, null: false

            def resolve(id:)
                ::User.find(id)
            end
        end
    end
end