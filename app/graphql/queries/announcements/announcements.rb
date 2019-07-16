module Queries
    module Announcements
        class Announcements < Queries::BaseQuery
            description 'Return a Collection of Announcements'

            null false

            type [Types::AnnouncementType], null: false

            def resolve()
                ::Announcement.all
            end
        end
    end
end