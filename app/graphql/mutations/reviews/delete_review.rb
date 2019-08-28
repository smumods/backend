module Mutations
    module Reviews
        class DeleteReview < Mutations::BaseMutation
            null true

            # Return type
            # Return nothing so we can return a JSON object
            # But specify field types instead
            field :success, Boolean, null: true
            field :message, String, null: true
            field :user, Types::UserType, null: true

            # Arguments
            argument :id, String, required: true

            def resolve(id:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                review = Review.where(user: current_user, id: id).first
                if review.nil?
                    raise GraphQL::ExecutionError.new("Caught ya! You are trying to delete an invalid review!")
                end
                if review.destroy!
                    return {
                        user: current_user,
                        message: "You have successfully deleted your review!",
                        success: true
                    }
                else
                    raise GraphQL::ExecutionError.new("You can't delete this due to an error! Invalid review or you do not have the rights to delete?")
                end
            end
        end
    end
end
