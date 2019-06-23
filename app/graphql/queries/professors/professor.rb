module Queries
    module Professors
        class Professor < Queries::BaseQuery
            description 'Return ONE Professor by name'
            
            argument :name, String, required: true

            type Types::ProfessorType, null: true

            def resolve(name:)
                ::Professor.find_by(name: name)
            end
        end
    end
end