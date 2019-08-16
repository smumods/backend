module Queries
    module Events
        class EventsOnDate < Queries::BaseQuery
            description 'Returns a List of Events on a specified day'

            argument :time, Integer, required: true, description: "Specify the day by timestamp. All events within 0000 hours to 2359 hours will be returned"

            type Types::EventType.connection_type, null: false

            def resolve(time:)
                date = Time.at(time)
                start_of_month = date.beginning_of_month
                end_of_month = date.end_of_month
                ::Event.where("start_date BETWEEN ? and ? AND require_rsvp = false", start_of_month, end_of_month).order("start_date ASC")
            end
        end
    end
end