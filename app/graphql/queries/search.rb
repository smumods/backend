module Queries
    class Search < Queries::BaseQuery
        description 'Search query'

        argument :query_string, String, required: true
        
        type [Types::SearchResultType], null: true

        def resolve(query_string:)
            results = []
            results = results + Course.where("name ilike ?", "%#{query_string}%")
            results = results + Professor.where("name ilike ?", "%#{query_string}%")
            results
        end
    end
end