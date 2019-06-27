module Mutations
    module Reviews
        class DeleteReview < Mutations::BaseMutation
            null true

            # Return type
            # Return nothing so we can return a JSON object
            # But specify field types instead
            field :success, Boolean, null: true
            field :message, String, null: true

            # Arguments
            argument :id, Int, required: true

            def resolve(id:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                end
                review = Review.where(user: current_user, id: id).first
                return { success: false, message: "You either do not have the rights to remove the review or there is no such review found" } if review.nil?
                review.delete
                return { success: true, message: "You have successfully deleted your review!" } if review.destroyed?
                return { success: false, message: "An unexpected error has occurred while trying to delete the review!"}
            end
        end
    end
end