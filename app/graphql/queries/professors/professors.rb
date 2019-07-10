module Queries
    module Professors
        class Professors < Queries::BaseQuery
            description 'Return all Professors'
            
            type Types::ProfessorType.connection_type, null: false

            def resolve
                ::Professor.all.order("name ASC")
            end
        end
    end
end