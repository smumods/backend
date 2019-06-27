module Queries
    module Professors
        class Professors < Queries::BaseQuery
            description 'Return all Professors'
            
            type Types::ProfessorType.connection_type, null: false

            def resolve
                ::Professor.all
            end
        end
    end
end