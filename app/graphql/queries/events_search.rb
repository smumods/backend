module Queries
    class EventsSearch < Queries::BaseQuery
        description 'Search query for Events'

        argument :query_string, String, required: true
        
        type [Types::EventSearchResultType], null: true

        def resolve(query_string:)
            return if query_string.empty?
            clubs = Set.new
            events = Set.new
            # Search clubs by query string
            clubs_by_query_string = ::Club.where("lower(name) ilike ?", "%#{query_string}%")
            clubs_by_query_string.each do |club|
                clubs.add club
            end
            # Search events by query string AND by club_id
            events_by_query_string = ::Event.where("lower(name) ilike ? OR description ilike ? OR club_id in (?)", "%#{query_string}%", "%#{query_string}%", clubs_by_query_string.ids).order('start_date DESC')
            club_ids_for_events_by_query_string = []
            events_by_query_string.each do |event|
                club_ids_for_events_by_query_string |= [event.club_id] # Set operation
                events.add event
            end
            # Requery clubs by club_ids found in events
            clubs_by_events_query_string = ::Club.where(id: club_ids_for_events_by_query_string)
            clubs_by_events_query_string.each do |club|
                clubs.add club
            end
            return clubs.to_a + events.to_a
        end
    end
end