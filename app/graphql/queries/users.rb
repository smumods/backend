module Queries
    class Users < Queries::BaseQuery
        description 'Return all Users for testing'
        
        type [Types::UserType], null: false

        def resolve
            ::User.all
        end
    end
end