module Queries
    module Home
        class Professors < Queries::BaseQuery
            description 'Home Query returning Professors (paginable)'
            
            type Types::ProfessorType.connection_type, null: false

            def resolve
                ::Professor.select("professors.*, COUNT(reviews.id) as reviews_count").joins("LEFT OUTER JOIN reviews ON (reviews.professor_id = professors.id)").order("reviews_count DESC").group("professors.id")
            end
        end
    end
end