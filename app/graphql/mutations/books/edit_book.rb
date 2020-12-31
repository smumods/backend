module Mutations
    module Books
        class EditBook < Mutations::BaseMutation
            null true

            argument :uuid, String, required: true
            argument :title, String, required: false
            argument :authors, String, required: false # TODO: Must be a Array in string format. Serialize this later using JSON.parse
            argument :isbn10, String, required: false
            argument :isbn13, String, required: false
            argument :module_code, String, required: false
            argument :is_used, Boolean, required: false
            argument :price, Float, required: false
            argument :description, String, required: false
            argument :photos, String, required: false # TODO: Array
            argument :is_telegram_contact, Boolean, required: false
            argument :is_sold, Boolean, required: false


            #Return Type
            type Types::BookType #update something, what you get back is what you changed data object

            def resolve(**args)
                #Validate if the user is logged in
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                return if current_user.nil?
                
                # Actual Logic
                return nil if args[:uuid].empty? #frontend will not be able to do anything if empty
                book = Book.where(uuid: args[:uuid], user_id: current_user).first
                return if book.nil?
                #logic for updating book object
                begin
                    book.authors = JSON.parse(args[:authors]) if args[:authors].present?
                    book.photos = JSON.parse(args[:photos])  if args[:photos].present?
                rescue JSON::ParserError
                    raise GraphQL::ExecutionError.new("Invalid photos/books format")
                end
                book.update({
                    title: args[:title] || book.title,
                    isbn10: args[:isbn10] || book.isbn10,
                    isbn13: args[:isbn13] || book.isbn13,
                    is_used: args[:is_used].nil? ? book.is_used : args[:is_used],
                    price: args[:price] || book.price,
                    description: args[:description] || book.description,
                    is_sold: args[:is_sold].nil? ? book.is_sold : args[:is_sold],
                })
                book #return book object
            end
        end
    end
end