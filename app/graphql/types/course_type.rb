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
		field :all_books, [Types::BookType], null: true
		field :books_count, Int, null: true
		field :all_professors, [Types::ProfessorType], null: true
		field :review_count, Int, null: true
		field :average_marking_score, Float, null: true
		field :average_engagement_score, Float, null: true
		field :average_fairness_score, Float, null: true
		field :average_workload_score, Float, null: true
		field :created_at, Types::DateTimeType, null: false
    	field :updated_at, Types::DateTimeType, null: false

		# Others

		def all_reviews
			::Review.joins(:course).where("module_code = ? AND reviews.course_id = courses.id", self.object.module_code).where.not(module_review: [nil, ''])
		end

		def all_books
			::Book.joins(:course).where("module_code = ? AND books.course_id = courses.id", self.object.module_code)
		end
		
		def all_professors
			module_code = self.object.module_code
			::Professor.joins(:courses)
						.where("courses.module_code = ?", module_code)
						.where("professors.name NOT LIKE '%INSTRUCTOR%'")
						.where("professors.name NOT LIKE '%INTRUCTOR%'")
						.distinct
		end

		def review_count
			all_reviews.size
		end

		def books_count
			all_books.where(is_sold: false).size
		end
	end
end