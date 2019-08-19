module Queries
    module Events
        class EventsOnDate < Queries::BaseQuery
            description 'Returns a List of Events on a specified day'

            argument :time, Integer, required: true, description: "Specify the day by timestamp. All events within 0000 hours to 2359 hours will be returned"

            type Types::EventType.connection_type, null: false

            def resolve(time:)
                puts "TIME NOW IS? #{Time.now.to_date}"
                puts "TIME ZONE IS? #{Time.zone.name}"
                date = Time.at(time)
                start_of_day = date.beginning_of_day
                puts "start_of_day is #{start_of_day}"
                end_of_day = date.end_of_day
                puts "end_of_day is #{end_of_day}"
                ::Event.where("start_date BETWEEN ? and ? AND require_rsvp = false", start_of_day, end_of_day).order("start_date ASC")
            end
        end
    end
end