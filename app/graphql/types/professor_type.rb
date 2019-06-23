module Types
	class ProfessorType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :all_courses, [Types::CourseType], null: true
		field :all_reviews, [Types::ReviewType], null: true
		field :engagement_score, Float, null: true
		field :marking_score, Float, null: true
		field :fairness_score, Float, null: true
		field :workload_score, Float, null: true

		def all_courses
			courses = {}
			self.object.courses.each do |course|
				course_module_code = course.module_code
				if courses[course_module_code].nil?
					courses[course_module_code] = Array.new
				end
				courses[course.module_code].push course
			end
			courses.keys.each do |key|
                courses[key].sort_by! { |c| ::Course.terms_order.index(c.term) }
                courses[key] = courses[key].first
			end
			return courses.values.flatten
		end

		def all_reviews
			self.object.reviews
		end
	end
end
