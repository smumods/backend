class Course < ApplicationRecord
    # Relationships
    has_many :professor_courses
    has_many :professors, through: :professor_courses

    # Validations
    validates :term, presence: true
    validates :module_code, presence: true
    validates :name, presence: true
end
