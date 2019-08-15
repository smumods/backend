class Types::ReviewSearchResultType < Types::BaseUnion
    description 'Courses and Professors that a Review Search may return'
    possible_types Types::CourseType, Types::ProfessorType

    def self.resolve_type(object, context)
        if object.is_a? Professor
            Types::ProfessorType
        else
            Types::CourseType
        end
    end
end