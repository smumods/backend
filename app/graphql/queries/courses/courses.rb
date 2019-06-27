module Queries
    module Courses
        class Courses < Queries::BaseQuery
            description 'Return all Courses'
            
            type Types::CourseType.connection_type, null: false

            def resolve
                ::Course.all
            end
        end
    end
end