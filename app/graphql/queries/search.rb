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

            Course.eager_load(:professor_courses, :professors).where("lower(courses.name) like ? OR lower(courses.module_code) like ? OR lower(professors.name) like ?", "%#{query_string.downcase}%", "%#{query_string.downcase}%", "%#{query_string.downcase}%").each do |course|
                course_module_code = course.module_code
                courses[course_module_code] = courses.fetch(course_module_code) { |c| Array.new }.push(course)
                course.professors.each do |professor|
                    professors.add professor
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