module Queries
    class Search < Queries::BaseQuery
        description 'Search query'

        argument :query_string, String, required: true
        
        type [Types::SearchResultType], null: true

        def resolve(query_string:)
            return if query_string.empty?
            
            results = []
            professors = Set.new
            courses = {}

            Course.where("name ilike ? OR module_code ilike ?", "%#{query_string}%", "%#{query_string}%").each do |course|
                course_module_code = course.module_code
                courses[course_module_code] = courses.fetch(course_module_code, Array.new).push course
            end

            courses.values.flatten.each do |course|
                course.professors.each do |professor|
                    professors.add professor
                end
            end

            Professor.where("name ilike ?", "%#{query_string}%").each do |professor|
                professors.add professor
                professor.courses.each do |course|
                    course_module_code = course.module_code
                    courses[course_module_code] = courses.fetch(course_module_code, Array.new).push course
                end
            end
            
            courses.keys.each do |key|
                courses[key].sort_by! { |c| terms_order.index(c.term) }
                courses[key] = courses[key].first
            end

            # Return a merged array
            professors.to_a + courses.values.flatten
        end

        private
        # Temporarily putting this here until we find a better place to house this
        def terms_order
            # Top-most with index of 0 is MOST important
            # Bottom with higher index is LEAST important
            start_year = 2016
            end_year = Date.current.year
            terms = ["1", "2", "3", "3A"]
            result = []
            (start_year..end_year).reverse_each do |year|
                next_year = (year + 1) % 100
                terms.reverse_each do |term|
                    result.push "#{year}-#{next_year} Term #{term}"
                end
            end
            result.freeze
        end
    end
end