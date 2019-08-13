module Queries
    module Events
        class Event < Queries::BaseQuery
            description 'Return ONE Event by id'
            
            argument :id, Integer, required: true

            type Types::EventType, null: true

            def resolve(id:)
                ::Event.find(id)
            end
        end
    end
end