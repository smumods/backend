class Course < ApplicationRecord
    validates :term, presence: true
    validates :module_code, presence: true
    validates :name, presence: true
end
