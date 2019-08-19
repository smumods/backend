module Queries
    module Clubs
        class Club < Queries::BaseQuery
            description 'Return ONE Club by slug'
            
            argument :slug, String, required: true

            type Types::ClubType, null: true

            def resolve(slug:)
                begin
                    club = ::Club.friendly.find(slug.downcase)
                rescue ActiveRecord::RecordNotFound => e
                    raise GraphQL::ExecutionError.new("Could not find a club with that link")
                else
                    return club
                end
            end
        end
    end
end