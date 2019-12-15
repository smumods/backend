module Mutations
    module Books
        class EditBook < Mutations::BaseMutation
            null true

            argument :id, String, required: true
            argument :title, String, required: false
            argument :authors, String, required: false # TODO: Must be a Array in string format. Serialize this later using JSON.parse
            argument :isbn, String, required: false
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
                # binding.pry breakpoint for debugging
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
                return nil if args[:id].empty? #frontend will not be able to do anything if empty
                book = Book.where(id: args[:id], user_id: current_user).first
                return if book.nil?
                #logic for updating book object
                book.update({
                    title: args[:title],
                    isbn: args[:isbn],
                    is_used: args[:is_used],
                    price: args[:price],
                    description: args[:description],
                    is_telegram_contact: args[:is_telegram_contact],
                    is_sold: args[:is_sold],
                    photos: JSON.parse(args[:photos]),
                    authors: JSON.parse(args[:authors]),
                })
                book #return book object
            end
        end
    end
end