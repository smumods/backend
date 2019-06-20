class Professor < ApplicationRecord
    has_many :professor_courses
    has_many :courses, through: :professor_courses
end
