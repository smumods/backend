module Queries
    module Home
        class Courses < Queries::BaseQuery
            description 'Home Query returning Courses (paginable)'
            
            argument :sort_type, String, required: true

            type Types::CourseType.connection_type, null: false

            def resolve(sort_type:)
                case sort_type
                when "Most Reviews"
                    ::Course.select("courses.module_code, courses.name, COUNT(reviews.id) as reviews_count").joins("LEFT OUTER JOIN reviews ON (reviews.course_id = courses.id)").order("reviews_count DESC, courses.module_code ASC").group("courses.module_code, courses.name")
                else
                    ::Course.all
                end
            end
        end
    end
end