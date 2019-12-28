module Mutations
    module Books
        class DeleteBook < Mutations::BaseMutation
            null true
            
            # GraphQL Payload Object
            field :success, Boolean, null: true
            field :message, String, null: true
            field :user, Types::UserType, null: true

            #Arguments
            argument :uuid, String, required: true

            def resolve(uuid:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                book = Book.where(uuid: uuid).first
                if book.nil?
                    raise GraphQL::ExecutionError.new("Caught ya! You are trying to delete an invalid book!")
                end
                if book.destroy!
                    return {
                        user: current_user,
                        message: "You have successfully deleted your book!",
                        success: true
                    }
                else
                    raise GraphQL::ExecutionError.new("You can't delete this due to an error! Invalid book or you do not have the rights to delete?")
                end
            end
        end
    end
end


