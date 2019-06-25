module Mutations
    module Votes
        class Vote < Mutations::BaseMutation
            null true

            argument :review_id, Int, required: true
            argument :review_type, String, required: true
            argument :vote_type, Int, required: true

            field :vote_count, Int, null: true
            field :success, Boolean, null: true

            def resolve(review_id:, review_type:, vote_type:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                end

                # Find review
                review = ::Review.find(review_id)
                # Return null if review is invalid
                return if review.nil?
                # Find vote and create if it isn't
                vote_type_updated = review.votes.find_or_create_by({
                    user: User.first,
                    review_type: review_type
                }).update(vote_type: vote_type)
                review_total_score = review.total_vote_score
                # Return the total count
                if vote_type_updated
                    return { vote_count: review_total_score, success: true }
                else
                    return { vote_count: review_total_score, success: false }
                end
            end
        end
    end
end