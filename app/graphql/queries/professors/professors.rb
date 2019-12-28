module Queries
    module Professors
        class Professors < Queries::BaseQuery
            description 'Return all Professors'
            
            type [Types::ProfessorType], null: false

            def resolve
                ::Professor.all.order("name ASC")
            end
        end
    end
end