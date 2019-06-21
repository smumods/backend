module Queries
    module Reviews
        class Reviews < Queries::BaseQuery
            description 'Return all Reviews'
            
            type [Types::ReviewType], null: false

            def resolve
                ::Review.all
            end
        end
    end
end


