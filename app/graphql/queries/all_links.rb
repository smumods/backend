module Queries
    class AllLinks < Queries::BaseQuery
        description 'Return all links'
        
        type [Types::LinkType], null: false

        def resolve
            ::Link.all
        end
    end
end