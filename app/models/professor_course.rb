class ProfessorCourse < ApplicationRecord
  belongs_to :professor, inverse_of: :professor_courses
  belongs_to :course, inverse_of: :professor_courses
end
