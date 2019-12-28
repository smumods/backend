module Queries
    module Events
        class AllRsvpEvents < Queries::BaseQuery
            description 'Returns all RSVP-required events, sorted by those expiring soonest'

            type Types::EventType.connection_type, null: false

            def resolve()
                # ::Event.where(start_date: Time.now..Float::INFINITY, require_rsvp: true).order("end_date ASC")
                ::Event.where("start_date >= ? AND require_rsvp = true", Time.now).order("end_date ASC")
            end
        end
    end
end