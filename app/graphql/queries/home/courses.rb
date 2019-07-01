module Queries
    module Home
        class Courses < Queries::BaseQuery
            description 'Home Query returning Courses (paginable)'
            
            argument :sort_type, String, required: true

            type Types::CourseType.connection_type, null: false

            def resolve(sort_type:)
                case sort_type
                when "Most Reviews"
                    ::Course.select("courses.*, COUNT(reviews.id) as reviews_count").joins("LEFT OUTER JOIN reviews ON (reviews.course_id = courses.id)").where("reviews.type_of_review = 'mod'").order("reviews_count DESC").group("courses.id") | Course.all
                else
                    ::Course.all
                end
            end
        end
    end
end