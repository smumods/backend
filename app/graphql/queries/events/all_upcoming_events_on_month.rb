module Queries
    module Events
        class AllUpcomingEventsOnMonth < Queries::BaseQuery
            description 'Returns a List of Upcoming Events for that month (specified by timestamp of any day in that month)'

            argument :month, Integer, required: true, description: "Specify the month by a timestamp of any of its days."

            type [Types::EventType], null: false

            def resolve(month:)
                date = Time.zone.at(month)
                start_of_month = date.beginning_of_month
                end_of_month = date.end_of_month
                ::Event.where("start_date BETWEEN ? and ? AND require_rsvp = false", start_of_month, end_of_month).order("start_date ASC")
            end
        end
    end
end