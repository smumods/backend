module Mutations
    module Votes
        class Vote < Mutations::BaseMutation
            null true

            argument :review_id, String, required: true
            argument :review_type, String, required: true
            argument :vote_type, Int, required: true

            field :vote_count, Int, null: true

            def resolve(review_id:, review_type:)
                # Find review
                review = Review.new(review_type: revi)
                review = Review.find_or_create(review_id)
                # Return null if review is invalid

                # Find vote and create if it isn't

                # If it is created already, delete the vote

                return if review.nil?
                review.
                return { vote_count: false }
            end
        end
    end
end