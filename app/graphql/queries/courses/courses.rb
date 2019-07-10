module Queries
    module Courses
        class Courses < Queries::BaseQuery
            description 'Return all Courses'
            
            type Types::CourseType.connection_type, null: false

            def resolve
                ::Course.all.order("module_code ASC, name ASC")
            end
        end
    end
end