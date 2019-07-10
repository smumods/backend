module Queries
    module Home
        class Professors < Queries::BaseQuery
            description 'Home Query returning Professors (paginable)'
            
            argument :sort_type, String, required: true

            type Types::ProfessorType.connection_type, null: false

            def resolve(sort_type:)
                case sort_type
                when "Most Reviews"
                    ::Professor.select("professors.*, COUNT(reviews.id) as reviews_count").joins("LEFT OUTER JOIN reviews ON (reviews.professor_id = professors.id)").where(" reviews.type_of_review = 'prof' ").order("reviews_count DESC").group("professors.id") | Professor.all
                else
                    ::Professor.all
                end
            end
        end
    end
end