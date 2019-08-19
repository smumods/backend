class Types::EventSearchResultType < Types::BaseUnion
    description 'CCAs and Events that an Event Search may return'
    possible_types Types::EventType, Types::ClubType

    def self.resolve_type(object, context)
        if object.is_a? Event
            Types::EventType
        else
            Types::ClubType
        end
    end
end