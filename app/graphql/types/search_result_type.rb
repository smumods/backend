class Types::SearchResultType < Types::BaseUnion
    description 'Courses and Professors that a search may return'
    possible_types Types::CourseType, Types::ProfessorType

    def self.resolve_type(object, context)
        if object.is_a? Professor
            Types::ProfessorType
        else
            Types::CourseType
        end
    end
end