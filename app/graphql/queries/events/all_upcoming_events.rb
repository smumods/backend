module Queries
    module Events
        class AllUpcomingEvents < Queries::BaseQuery
            description 'Returns a Paginable List of Upcoming Events'

            type [Types::EventType], null: false

            def resolve()
                ::Event.where("start_date >= ? and require_rsvp = false", Time.now).order("start_date ASC")
            end
        end
    end
end