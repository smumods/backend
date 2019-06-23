module Types
	class ProfessorType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :all_courses, [Types::CourseType], null: true
		field :all_reviews, [Types::ReviewType], null: true
		field :review_count, Int, null: true
		field :engagement_score, Float, null: true
		field :marking_score, Float, null: true
		field :fairness_score, Float, null: true
		field :workload_score, Float, null: true
		field :overall_score, Float, null: true

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

		def review_count
			all_reviews.length		
		end

		def engagement_score
			engagement_scores = self.object.reviews.collect(&:engagement_score)
			(engagement_scores.sum.to_f / engagement_scores.length).round(1)
		end
		
		def marking_score
			marking_scores = self.object.reviews.collect(&:marking_score)
			(marking_scores.sum.to_f / marking_scores.length).round(1)
		end
		
		def fairness_score
			fairness_scores = self.object.reviews.collect(&:fairness_score)
			(fairness_scores.sum.to_f / fairness_scores.length).round(1)
		end
		
		def workload_score
			workload_scores = self.object.reviews.collect(&:workload_score)
			(workload_scores.sum.to_f / workload_scores.length).round(1)
		end

		def overall_score
			[marking_score, engagement_score, fairness_score, workload_score].sum.to_f / 4.0
		end
	end
end
