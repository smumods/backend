module Mutations
    module Reviews
        class EditReview < Mutations::BaseMutation
            null true

            # Arguments
            argument :id, Int, required: true
            argument :module_review, String, required: false
            argument :professor_review, String, required: false
            argument :is_anonymous, Boolean, required: false
            argument :marking_score, Int, required: false
            argument :engagement_score, Int, required: false
            argument :fairness_score, Int, required: false
            argument :workload_score, Int, required: false
            argument :professor_slug, String, required: false
            argument :type_of_review, String, required: false
            argument :course_id, Int, required: false

            # return type from the mutation
            type Types::ReviewType

            # is_anonymous:, module_review:, course_id:, 
            def resolve(**args)
                # Authenticate user
                current_user = context[:current_user]
                if current_user.blank?
                    raise GraphQL::ExecutionError.new("Authentication required")
                elsif not current_user.verified
                    raise GraphQL::ExecutionError.new("Please verify your email first!")
                    return
                end
                
                # Edit Review Logic
                review = Review.where(id: args[:id], user_id: current_user).first
                return if review.nil?
                if args[:professor_slug].nil? or args[:professor_slug].empty?
                    review.update({
                        module_review: args[:module_review],
                        is_anonymous: args[:is_anonymous],
                        professor_review: args[:professor_review],
                        module_review: args[:module_review],
                        marking_score: args[:marking_score],
                        engagement_score: args[:engagement_score],
                        fairness_score: args[:fairness_score],
                        workload_score: args[:workload_score],
                        course_id: args[:course_id]
                    })
                else
                    begin
                        professor = Professor.friendly.find(args[:professor_slug])
                    rescue => e
                        raise GraphQL::ExecutionError.new("Invalid professor")
                        return
                    end
                    review.update({
                        module_review: args[:module_review],
                        is_anonymous: args[:is_anonymous],
                        professor_review: args[:professor_review],
                        module_review: args[:module_review],
                        marking_score: args[:marking_score],
                        engagement_score: args[:engagement_score],
                        fairness_score: args[:fairness_score],
                        workload_score: args[:workload_score],
                        professor: professor,
                        course_id: args[:course_id]
                    })
                end
                review
            end
        end
    end
end