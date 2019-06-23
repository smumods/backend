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
        field :user, Types::UserType, null: false
        field :professor, Types::ProfessorType, null: true
        field :course, Types::CourseType, null: false
        field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false
    end
end