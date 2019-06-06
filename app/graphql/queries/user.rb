module Queries
    class User < Queries::BaseQuery
        description 'Return an individual user'
        
        argument :id, ID, required: true

        type Types::UserType, null: false

        def resolve(id:)
            ::User.find(id)
        end
    end
end