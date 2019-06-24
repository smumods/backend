module Mutations
    module Votes
        class Vote < Mutations::BaseMutation
            null true

            argument :review_id, Int, required: true
            argument :review_type, String, required: true
            argument :vote_type, Int, required: true

            field :vote_count, Int, null: true

            def resolve(review_id:, review_type:, vote_type:)
                # Find review
                review = Review.find(review_id)
                # Return null if review is invalid
                return if review.nil?
                # Find vote and create if it isn't
                review.votes.find_or_create_by({
                    user: User.last,
                    review_type: review_type
                }).update(vote_type: vote_type)
                # Return t  he total count
                return { vote_count: review.total_vote_score }
            end
        end
    end
end