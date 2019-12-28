module Queries
    module Events
        class AllRecommendedEvents < Queries::BaseQuery
            description 'Returns all future events from now based on User subscriptions to Clubs; Requires user to be logged in'

            type Types::EventType.connection_type, null: false

            def resolve
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                
                return if current_user.nil?
                bookmarked_club_ids = current_user.bookmark_club_ids
                club_memberships_club_ids = current_user.club_memberships.collect(&:id)
                club_ids = bookmarked_club_ids | club_memberships_club_ids # nerge arrays with set operation (only unique ids)
                bookmarked_event_ids = current_user.bookmark_events.ids
                ::Event.where("(id IN (?) OR club_id IN (?)) AND start_date >= ?", bookmarked_event_ids, club_ids, Time.now).order("end_date ASC")
            end
        end
    end
end