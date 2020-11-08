module Types
    class ReviewType < BaseObject
        field :id, ID, null: false
        field :professor_review, String, null: true
        field :module_review, String, null: true
        field :has_read_more, Boolean, null: true
        field :is_anonymous, Boolean, null: true
        field :marking_score, Int, null: true
        field :engagement_score, Int, null: true
        field :fairness_score, Int, null: true
        field :workload_score, Int, null: true
        field :overall_score, Float, null: true
        field :user, Types::UserType, null: false, method: :user
        field :professor, Types::ProfessorType, null: true
        field :professor_or_course, Types::ReviewResultType, null: true
        field :course, Types::CourseType, null: true
        field :type_of_review, String, null: true
        field :total_prof_score, Int, null: true
        field :total_mod_score, Int, null: true
        field :total_vote_score, Int, null: true
        field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false

        def module_review
            review = self.object.module_review
            return nil unless review

            @_current_user ||= context[:current_user]
            return review.truncate(Review::TRUNCATE_LENGTH) unless @_current_user and @_current_user.can_read_review?
            return review
        end
        
        def professor_review
            review = self.object.professor_review
            return nil unless review

            @_current_user ||= context[:current_user]
            return review.truncate(Review::TRUNCATE_LENGTH) unless @_current_user && @_current_user.can_read_review?
            return review
        end

        def overall_score
            score_array = ["marking_score", "engagement_score", "fairness_score", "workload_score"].collect { |score| self.object[score.to_sym] }
            return if score_array.include? nil
            score_array.sum.to_f / 4.0
        end

        def user
            if self.object.is_anonymous
                return User.new(first_name: "Anonymous", last_name: "")
            else
                return self.object.user
            end
        end

        def professor_or_course
            type_of_review = self.object.type_of_review
            if type_of_review == "mod"
                return self.object.course
            elsif type_of_review == "prof"
                return self.object.professor
            else
                return
            end
        end
    end
end