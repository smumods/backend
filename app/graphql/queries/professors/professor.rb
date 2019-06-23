module Queries
    module Professors
        class Professor < Queries::BaseQuery
            description 'Return ONE Professor by slug'
            
            argument :slug, String, required: true

            type Types::ProfessorType, null: true

            def resolve(slug:)
                ::Professor.friendly.find(slug)
            end
        end
    end
end