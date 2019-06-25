module Queries
    module Reviews
        class Review < Queries::BaseQuery
            description 'Return a Review given an ID'

            argument :id, Int, required: true

            type Types::ReviewType, null: true

            def resolve(id:)
                ::Review.find(id)
            end
        end
    end
end