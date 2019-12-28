module Mutations
    module Bookmarks
        class SaveBook < Mutations::BaseMutation
            null true

            argument :uuid, String, required: true

            type Types::UserType

            def resolve(uuid:)
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                
                return if current_user.nil?
                book = Book.find_by(uuid: uuid)
                return if book.nil?
                if current_user.bookmark_book? book
                    current_user.destroy_action(:bookmark, target: book)
                else
                    current_user.create_action(:bookmark, target: book)
                end
                current_user
            end
        end
    end
end