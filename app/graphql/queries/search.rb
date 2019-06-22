module Queries
    class Search < Queries::BaseQuery
        description 'Search query'

        argument :query_string, String, required: true
        
        type String, null: false

        def resolve(query_string:)
            query_string
        end
    end
end