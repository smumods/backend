module Queries
    module Courses
        class Course < Queries::BaseQuery
            description 'Return an individual Course by moduleCode and term'

            # Allow returning of null course if can't find
            null true
            
            argument :module_code, String, required: true

            type Types::CourseType, null: true

            def resolve(module_code: nil, term: nil)
                courses = ::Course.where(module_code: module_code)
                course = courses.sort_by { |c| ::Course.terms_order.index(c.term) }.first
                course
            end
        end
    end
end