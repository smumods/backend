module Types
    class ReviewType < BaseObject
        field :id, ID, null: false
        field :professor_review, String, null: true
        field :module_review, String, null: false
        field :is_anonymous, Boolean, null: false
        field :marking_score, Int, null: true
        field :engagement_score, Int, null: true
        field :fairness_score, Int, null: true
        field :workload_score, Int, null: true
        field :overall_score, Float, null: true
        field :user, Types::UserType, null: true, method: :user
        field :professor, Types::ProfessorType, null: true
        field :course, Types::CourseType, null: false
        field :type_of_review, String, null: false
        field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false

        def overall_score
            score_array = ["marking_score", "engagement_score", "fairness_score", "workload_score"].collect { |score| self.object[score.to_sym] }
            return if score_array.include? nil
            score_array.sum.to_f / 4.0
        end
    end
end