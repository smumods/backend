module Types
    class ReviewType < BaseObject
        field :professor_review, String, null: true
        field :module_review, String, null: false
        field :is_anonymous, Boolean, null: false
        field :marking_score, Int, null: false
        field :engagement_score, Int, null: false
        field :fairness_score, Int, null: false
        field :workload_score, Int, null: false
        field :user, Types::UserType, null: false
        field :professor, Types::ProfessorType, null: true
        field :course, Types::CourseType, null: false
    end

    
end