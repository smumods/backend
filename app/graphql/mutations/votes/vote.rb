module Mutations
    module Votes
        class Vote < Mutations::BaseMutation
            null true

            argument :review_id, String, required: true
            argument :review_type, String, required: true
            argument :vote_type, Int, required: true

            field :vote_count, Int, null: true
            field :success, Boolean, null: true
            field :vote, Types::VoteType, null: true

            def resolve(review_id:, review_type:, vote_type:)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                    return
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end

                # Find review
                review = ::Review.find(review_id)
                # Return null if review is invalid
                if review.nil?
                    raise GraphQL::ExecutionError.new("Invalid review")
                    return
                end
                # Find vote and create if it isn't
                vote = review.votes.find_or_create_by({
                    user: current_user,
                    review_type: review_type
                })
                if vote.nil?
                    raise GraphQL::ExecutionError.new("Invalid vote")
                    return
                end
                vote.assign_attributes({
                    vote_type: vote_type
                })
                vote_type_updated = vote.save(validate: false)
                review_total_score = review.total_vote_score
                # Return the total count
                if vote_type_updated
                    return { vote: current_user.votes.where(review_id: review).first, vote_count: review_total_score, success: true }
                else
                    raise GraphQL::ExecutionError.new("Invalid review")
                    return
                end
            end
        end
    end
end
