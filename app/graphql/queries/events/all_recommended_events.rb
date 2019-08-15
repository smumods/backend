module Queries
    module Events
        class AllRecommendedEvents < Queries::BaseQuery
            description 'Returns all future events from now based on User subscriptions to Clubs'

            argument :user_id, ID, required: true

            type [Types::EventType], null: false

            def resolve(user_id:)
                ::Event.where("start_date >= ? AND require_rsvp = false", Time.now).order("end_date ASC")
            end
        end
    end
end