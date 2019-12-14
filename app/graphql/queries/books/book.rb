module Queries #always queries. like a package, think of it as a big box
    module Books #module should be plural
        class Book < Queries::BaseQuery
            description 'Return 1 book instance by the UUID' 

            # Allow returning of null book if can't find
            null true
            
            argument :uuid, String, required: true

            type Types::BookType, null: true

            def resolve(uuid: nil) #when call book query, you are passing uuid. when it is resolved
                return nil if uuid.empty? #check if empty
                ::Book.find_by(id: uuid) #not reffering to the current class, referring to book.rb active record
            end
        end
    end
end