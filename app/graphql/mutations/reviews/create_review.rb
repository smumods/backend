module Mutations
    module Reviews
        class CreateReview < Mutations::BaseMutation
            null true

            # Arguments
            argument :module_review, String, required: false
            argument :professor_review, String, required: false
            argument :is_anonymous, Boolean, required: false
            argument :marking_score, Int, required: false
            argument :engagement_score, Int, required: false
            argument :fairness_score, Int, required: false
            argument :workload_score, Int, required: false
            argument :professor_slug, String, required: false
            argument :type_of_review, String, required: false
            argument :course_id, String, required: false

            # return type from the mutation
            type Types::ReviewType

            # is_anonymous:, module_review:, course_id:,
            def resolve(**args)
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                review = Review.create_with({
                    is_anonymous: args[:is_anonymous],
                    user: current_user,
                    type_of_review: args[:type_of_review]
                })
                if args[:professor_slug].nil? or args[:professor_slug].empty?
                    # Normal Review
                    review = review.create({
                        module_review: args[:module_review],
                        course_id: args[:course_id],
                    })
                else
                    # With Professor Review
                    if args[:course_id] < 0
                        review = review.create({
                            professor_review: args[:professor_review],
                            module_review: args[:module_review],
                            marking_score: args[:marking_score],
                            engagement_score: args[:engagement_score],
                            fairness_score: args[:fairness_score],
                            workload_score: args[:workload_score],
                            professor: Professor.friendly.find(args[:professor_slug])
                        })
                    else
                        review = review.create({
                            professor_review: args[:professor_review],
                            module_review: args[:module_review],
                            course_id: args[:course_id],
                            marking_score: args[:marking_score],
                            engagement_score: args[:engagement_score],
                            fairness_score: args[:fairness_score],
                            workload_score: args[:workload_score],
                            professor: Professor.friendly.find(args[:professor_slug])
                        })
                    end
                end
                review
            end
        end
    end
end
