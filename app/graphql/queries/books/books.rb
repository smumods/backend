module Queries
    module Books
        class Books < Queries::BaseQuery
            description 'Return all Books'
            
            type [Types::BookType], null: false

            def resolve
                ::Book.all.order("created_at DESC")
            end
        end
    end
end
