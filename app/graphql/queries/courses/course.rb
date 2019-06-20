module Queries
    module Courses
        class Course < Queries::BaseQuery
            description 'Return an individual Course by moduleCode and term'

            # Allow returning of null course if can't find
            null true
            
            argument :module_code, String, required: true
            argument :term, String, required: true

            type Types::CourseType, null: false

            def resolve(module_code: nil, term: nil)
                ::Course.where(module_code: module_code, term: term).first
            end
        end
    end
end