module Mutations
    module Books
        class CreateBook < Mutations::BaseMutation
            null true

            argument :title, String, required: true
            argument :authors, String, required: true # TODO: Must be a Array in string format. Serialize this later using JSON.parse
            argument :isbn10, String, required: true
            argument :isbn13, String, required: true
            argument :module_code, String, required: true
            argument :is_used, Boolean, required: true
            argument :price, Float, required: true
            argument :description, String, required: true
            argument :photos, String, required: true # TODO: Array
            argument :is_telegram_contact, Boolean, required: true
            argument :is_sold, Boolean, required: true

            # Return Type
            type Types::BookType

            def resolve(**args)
                # Validate if user is logged in
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                return if current_user.nil?

                # Actual Logic
                # Check if course is valid
                courses_by_mod_code = Course.where(module_code: args[:module_code])
                if courses_by_mod_code.nil? or courses_by_mod_code.empty?
                    raise GraphQL::ExecutionError.new("Invalid module code")
                    return
                end
                # TODO: I want to get the latest course (by code) and by term.
                course = courses_by_mod_code.first
                book = current_user.books.create({
                    title: args[:title],
                    authors: JSON.parse(args[:authors]),
                    isbn10: args[:isbn10],
                    isbn13: args[:isbn13],
                    is_used: args[:is_used],
                    price: args[:price],
                    description: args[:description],
                    photos: JSON.parse(args[:photos]),
                    is_telegram_contact: args[:is_telegram_contact],
                    is_sold: args[:is_sold],
                    course: course
                    })
                raise GraphQL::ExecutionError.new("Error creating book: #{book.errors.full_messages.join(" and ")}") if not book.persisted?
                book
            end
        end
    end
end