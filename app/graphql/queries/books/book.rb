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
                #current class Book is not an active records object, add double colon,
                #that book refers to the current class
                ::Book.find_by(uuid: uuid) #not reffering to the current class, referring to book.rb active record
            end
        end
    end
end
