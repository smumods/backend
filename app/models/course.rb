class Course < ApplicationRecord
    # Relationships
    has_many :professor_courses
    has_many :professors, through: :professor_courses
    has_many :reviews

    # Validations
    validates :term, presence: true
    validates :module_code, presence: true
    validates :name, presence: true

    def self.academic_group_abbreviation(input)
        abbr_mapper = {
            "School of Information Systems"=> "SIS",
            "Lee Kong Chian Sch of Business"=> "SOB",
            "School of Social Sciences"=> "SOSS",
            "School of Economics"=> "SOE",
            "Office of Career Services"=> "OCS",
            "Ctr for Professional Studies"=> "CPS",
            "School of Accountancy"=> "SOA",
            "School of Law"=> "SOL",
            "Ctr for English Communication"=> "CEC"
        }
        return abbr_mapper[input]
    end

    def self.module_code_front(input)
        input.match(/[a-zA-Z]+/i)[0]
    end
end
