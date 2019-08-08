module Queries
    module Events
        class AllUpcomingEvents < Queries::BaseQuery
            description 'Returns a Paginable List of Upcoming Events'

            type Types::EventType.connection_type, null: false

            def resolve()
                ::Event.where("start_date > ?", Time.now)
            end
        end
    end
end