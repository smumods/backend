module Types
	class CourseType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :career, String, null: false
		field :grading_basis, String, null: false
		field :course_components, String, null: false
		field :campus, String, null: false
		field :academic_group, String, null: false
		field :academic_organization, String, null: false
		field :module_code, String, null: false
		field :credit_units, Float, null: false
		field :description, String, null: false
		field :term, String, null: false
		field :academic_group_abbreviation, String, null: false
		field :module_code_front, String, null: false
		field :all_reviews, [Types::ReviewType], null: true
		field :review_count, Int, null: true
		field :all_professors, [Types::ProfessorType], null: true
		field :reviews_count, Int, null: true
		field :average_marking_score, Float, null: true
		field :average_engagement_score, Float, null: true
		field :average_fairness_score, Float, null: true
		field :average_workload_score, Float, null: true
		field :created_at, Types::DateTimeType, null: false
    	field :updated_at, Types::DateTimeType, null: false

		# Others

		def all_reviews
			module_code = self.object.module_code
			reviews = Course.where(module_code: module_code).collect(&:reviews).flatten
			reviews
		end
		
		def review_count
			all_reviews.length		
		end

		def all_professors
			module_code = self.object.module_code
			::Course.where(module_code: module_code).includes(:professors).collect(&:professors).flatten.uniq
		end

		def reviews_count
			return self.object.reviews_count if self.object.respond_to? :reviews_count
			return nil
		end
	end
end