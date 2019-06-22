module Queries
    class Search < Queries::BaseQuery
        description 'Search query'

        argument :query_string, String, required: true
        
        type [Types::SearchResultType], null: true

        def resolve(query_string:)
            return if query_string.empty?
            
            results = []
            professors = Set.new
            courses = Set.new
            # Search by course, then pull the relevant professors
            # Get the courses first
            course_courses = Course.where("name ilike ?", "%#{query_string}%") # by name
            course_courses = course_courses + Course.where("module_code ilike ?", "%#{query_string}%") # by module_code
            course_courses.each { |course| courses.add(course) }
            # Get the professors next
            courses.collect(&:professors).flatten.each { |professor| professors.add(professor) }

            # Search by professor, then pull the relevant courses
            professor_professors = Professor.where("name ilike ?", "%#{query_string}%")
            professor_professors.each { |professor| professors.add(professor) }
            professor_professors.collect(&:courses).flatten.each { |course| courses.add(course) }
            
            # Get all professors teaching each course
            courses.each { |course| course.professors.each { |professor| professors.add(professor) } }

            # Return a merged array
            professors.to_a + courses.to_a
        end
    end
end