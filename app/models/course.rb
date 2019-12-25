class Course < ApplicationRecord
    # Relationships
    has_many :professor_courses
    has_many :professors, through: :professor_courses
    has_many :reviews
    has_many :books

    # Validations
    validates :term, presence: true
    validates :module_code, presence: true
    validates :name, presence: true

    # scopes
    def average_marking_score
        reviews.sum("marking_score").to_f / reviews.load.size
    end
    
    def average_engagement_score
        reviews.sum("engagement_score").to_f / reviews.load.size
    end
    
    def average_fairness_score
        reviews.sum("fairness_score").to_f / reviews.load.size
    end
    
    def average_workload_score
        reviews.sum("workload_score").to_f / reviews.load.size
    end
    
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
    
    def self.terms_order
        # Top-most with index of 0 is MOST important
        # Bottom with higher index is LEAST important
        start_year = 2016
        end_year = Date.current.year
        terms = ["1", "2", "3", "3A"]
        result = []
        (start_year..end_year).reverse_each do |year|
            next_year = (year + 1) % 100
            terms.reverse_each do |term|
                result.push "#{year}-#{next_year} Term #{term}"
            end
        end
        result.freeze
    end

    def self.latest_course(module_code)
        courses = Course.where(module_code: module_code)
        return courses.sort_by { |c| Course.terms_order.index(c.term) }.first
    end
end
