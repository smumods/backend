module Queries
    module Events
        class AllUpcomingEventsOnMonth < Queries::BaseQuery
            description 'Returns a List of Upcoming Events for that month (specified by timestamp of any day in that month)'

            argument :month, Integer, required: true, description: "Specify the month by a timestamp of any of its days."

            type [Types::EventType], null: false

            def resolve(month:)
                
                ::Event.where("start_date >= ? and require_rsvp = false", Time.now).order("start_date ASC")
            end
        end
    end
end