module Queries
    class EventsSearch < Queries::BaseQuery
        description 'Search query for Events'

        argument :query_string, String, required: true
        
        type [Types::EventSearchResultType], null: true

        def resolve(query_string:)
            return if query_string.empty?
            results = []
            results << ::Club.where("lower(name) ilike ?", "%#{query_string}%").to_a
            results << ::Event.where("lower(name) ilike ? OR description ilike ?", "%#{query_string}%", "%#{query_string}%").to_a
            return results.flatten
        end
    end
end